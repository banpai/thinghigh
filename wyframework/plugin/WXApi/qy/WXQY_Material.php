<?php
/**
 * @package		WXQYApi
 * @author		jinye
 * @copyright	Copyright (c) weyue, Inc.
 * @since		Version 1.0.0
 */
include_once "Base.class.php";
include_once "WXQY_Error.class.php";

class WXQY_Material extends Base{

	public $m_wid;
	public $m_rid;
	public $m_accessToken;

	const API_URL = 'https://qyapi.weixin.qq.com/cgi-bin/material/%s?access_token=%s';

	/**
	 * 构造函数
	 * @param $wid int 站点id
	 * @param $rid string 识别id
	 */
	public function __construct($wid, $rid)
	{
		$this->m_wid = $wid;
		$this->m_rid = $rid;

		$wxqy_accessToken = new WXQY_AccessToken($wid, $rid);
		$this->m_accessToken = $wxqy_accessToken->getAccessToken();
	}

	/**
	 * 上传临时素材文件
	 * @param $filepath string 文件完整路径
	 * @param $filename string 需要显示的文件名
	 * @param $type string 媒体文件类型，分别有图片（image）、语音（voice）、视频（video），普通文件(file)
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "type": "image",
	 *    "media_id": "1G6nrLmr5EC3MMb_-zK1dDdzmd0p7cNliYu9V5w7o8K0",
	 *    "created_at": "1380000000"
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 41011,
	 *    "errmsg": "missing agentid"
	 * }
	 */
	public function uploadTempFile($filepath, $filename='', $type='file'){
		$filepath = mb_convert_encoding($filepath,'GBK','utf8');//防止文件中文名无法识别

		if(!file_exists($filepath)){
			$resultJson = array(
				'errcode'=>'-1',
				'errmsg'=>'文件不存在'
			);

			return $resultJson;
		}

		$typeCheckResult = $this->checkType($filepath, $type);
		if($typeCheckResult['errcode'] != 0){
			$resultJson = array(
				'errcode'=>'-1',
				'errmsg'=>$typeCheckResult['errmsg']
			);

			return $resultJson;
		}

		$sizeCheckResult = $this->checkSize($filepath, $type);
		if($sizeCheckResult['errcode'] != 0){
			$resultJson = array(
				'errcode'=>'-1',
				'errmsg'=>$sizeCheckResult['errmsg']
			);

			return $resultJson;
		}

		$fileinfo = '@'.$filepath;
		if($filename != ''){
			$fileinfo = $fileinfo . ';filename=' . $filename;
		}

		$url = 'https://qyapi.weixin.qq.com/cgi-bin/media/upload?access_token='.$this->m_accessToken.'&type='.$type;
		$result = HttpCurl::post($url, array('file'=>$fileinfo));
		$resultJson = json_decode($result, true);

		if(isset($resultJson['errcode'])){
			self::errlog(__METHOD__, func_get_args(), '上传临时素材文件错误:'.$result);
		}

		return $resultJson;
	}

	private function checkType($filepath, $type){
		$result = array('errcode'=>0, 'errmsg'=>'');
		$ext = pathinfo($filepath, PATHINFO_EXTENSION);

		if($type == 'image' && $ext != 'jpg' && $ext != 'png'){
			$result['errcode'] = '-1';
			$result['errmsg'] = '图片格式必须是jpg或png';
		}
		elseif($type == 'voice' && $ext != 'arm'){
			$result['errcode'] = '-1';
			$result['errmsg'] = '语音格式必须是arm';
		}
		elseif($type == 'video' && $ext != 'mp4'){
			$result['errcode'] = '-1';
			$result['errmsg'] = '视屏格式必须是mp4';
		}

		return $result;
	}

	private function checkSize($filepath, $type){
		$kb = 1024;          // Kilobyte
		$mb = 1024 * $kb;    // Megabyte

		$result = array('errcode'=>0, 'errmsg'=>'');

		$size = filesize($filepath);

		if($size <= 5){
			$result['errcode'] = '-1';
			$result['errmsg'] = '文件必须大于5个字节';
		}
		elseif($type == 'image' && $size > 2*$mb){
			$result['errcode'] = '-1';
			$result['errmsg'] = '图片不能超过2MB';
		}
		elseif($type == 'voice' && $size > 2*$mb){
			$result['errcode'] = '-1';
			$result['errmsg'] = '语音不能超过2MB';
		}
		elseif($type == 'video' && $size > 10*$mb){
			$result['errcode'] = '-1';
			$result['errmsg'] = '视频不能超过10MB';
		}
		elseif($type == 'file' && $size > 20*$mb){
			$result['errcode'] = '-1';
			$result['errmsg'] = '普通文件不能超过20MB';
		}

		return $result;
	}

	/**
	 * 获取素材总数
	 * @param $agentid int 应用id
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": 0,
	 *    "errmsg": "ok",
	 *    "total_count": 37,
	 *    "image_count": 12,
	 *    "voice_count": 10,
	 *    "video_count": 3,
	 *    "file_count": 3,
	 *    "mpnews_count": 6
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 41011,
	 *    "errmsg": "missing agentid"
	 * }
	 */
	public function getCount($agentid){
		$url = sprintf(self::API_URL, 'get_count', $this->m_accessToken).'&agentid='.$agentid;

		$result = HttpCurl::get_contents($url);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '获取素材总数错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 获取素材列表
	 * @param $agentid int 应用id
	 * @param $type string 素材类型，可以为图文(mpnews)、图片（image）、音频（voice）、视频（video）、文件（file）
	 * @param $offset int 从该类型素材的该偏移位置开始返回，0表示从第一个素材 返回
	 * @param $count int 返回素材的数量，取值在1到50之间
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": 0,
	 *    "errmsg": "ok",
	 *    "type": "image",
	 *    "total_count": 12,
	 *    "item_count": 1,
	 *    "itemlist": [
	 *        {
	 *            "media_id": "2qN9QW-6HI3-AXuvAMi0vYQTyAm7k0Vgiuf7t5Kl4hjOwhYGwY",
	 *            "filename": "test01.png",
	 *            "update_time": 1434686658
	 *        }
	 *    ]
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 41011,
	 *    "errmsg": "missing agentid"
	 * }
	 */
	public function getList($agentid, $type, $offset=0, $count=10){
		$package = array('agentid'=>$agentid, 'type'=>$type, 'offset'=>$offset, 'count'=>$count);
		$sendJson = self::jsonencode_unescape($package);

		$url = sprintf(self::API_URL, 'batchget', $this->m_accessToken);
		$result = HttpCurl::postJson($url, $sendJson);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '获取素材列表错误:'.$result);
		}

		return $resultJson;
	}
}
?>