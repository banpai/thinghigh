<?php
/**
 * @package		WXQYApi
 * @author		jinye
 * @copyright	Copyright (c) weyue, Inc.
 * @since		Version 1.0.0
 */
include_once "Base.class.php";
include_once "WXQY_Error.class.php";

class WXQY_Send extends Base{

	public $m_wid;
	public $m_rid;
	public $m_accessToken;

	const API_URL = 'https://qyapi.weixin.qq.com/cgi-bin/message/send?access_token=';

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
	 * 发送text消息
	 * @param $agentid int 应用id
	 * @param $content string 消息内容
	 * @param $userList array 成员ID列表（消息接收者，多个接收者用‘|’分隔，最多支持1000个）。特殊情况：指定为@all，则向关注该企业应用的全部成员发送
	 * @param $partyList array 部门ID列表，多个接收者用‘|’分隔，最多支持100个。当touser为@all时忽略本参数
	 * @param $tagList array 标签ID列表，多个接收者用‘|’分隔。当touser为@all时忽略本参数
	 * @param $safe int 表示是否是保密消息，0表示否，1表示是，默认0
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": "0",
	 *    "errmsg": "OK"
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 82001,
	 *    "errmsg": "All touser & toparty & totag invalid"
	 * }
	 */
	public function sendText($agentid, $content, $userList=null, $partyList=null, $tagList=null, $safe=0){
		$sendArr = array();

		if(isset($userList)){
			$sendArr['touser'] = implode('|', $userList);
		}
		if(isset($partyList)){
			$sendArr['toparty'] = implode('|', $partyList);
		}
		if(isset($tagList)){
			$sendArr['totag'] = implode('|', $tagList);
		}

		$sendArr['msgtype'] = 'text';
		$sendArr['agentid'] = $agentid;
		$sendArr['text'] = array('content'=>$content);
		$sendArr['safe'] = $safe;
		$sendJson = self::jsonencode_unescape($sendArr);

		$url = self::API_URL.$this->m_accessToken;
		$result = HttpCurl::postJson($url, $sendJson);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '发送text消息错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 发送news消息
	 * @param $agentid int 应用id
	 * @param $articles array news消息内容
	 * @param $userList array 成员ID列表（消息接收者，多个接收者用‘|’分隔，最多支持1000个）。特殊情况：指定为@all，则向关注该企业应用的全部成员发送
	 * @param $partyList array 部门ID列表，多个接收者用‘|’分隔，最多支持100个。当touser为@all时忽略本参数
	 * @param $tagList array 标签ID列表，多个接收者用‘|’分隔。当touser为@all时忽略本参数
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": "0",
	 *    "errmsg": "OK"
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 82001,
	 *    "errmsg": "All touser & toparty & totag invalid"
	 * }
	 */
	public function sendNews($agentid, $articles, $userList=null, $partyList=null, $tagList=null){
		$sendArr = array();

		if(isset($userList)){
			$sendArr['touser'] = implode('|', $userList);
		}
		if(isset($partyList)){
			$sendArr['toparty'] = implode('|', $partyList);
		}
		if(isset($tagList)){
			$sendArr['totag'] = implode('|', $tagList);
		}
		$sendArr['msgtype'] = 'news';
		$sendArr['agentid'] = $agentid;
		$sendArr['news'] = array('articles'=>$articles);
		$sendJson = self::jsonencode_unescape($sendArr);

		$url = self::API_URL.$this->m_accessToken;
		$result = HttpCurl::postJson($url, $sendJson);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '发送news消息错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 发送file消息
	 * @param $agentid int 应用id
	 * @param $media_id string 媒体文件id
	 * @param $userList array 成员ID列表（消息接收者，多个接收者用‘|’分隔，最多支持1000个）。特殊情况：指定为@all，则向关注该企业应用的全部成员发送
	 * @param $partyList array 部门ID列表，多个接收者用‘|’分隔，最多支持100个。当touser为@all时忽略本参数
	 * @param $tagList array 标签ID列表，多个接收者用‘|’分隔。当touser为@all时忽略本参数
	 * @param $safe int 表示是否是保密消息，0表示否，1表示是，默认0
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": "0",
	 *    "errmsg": "OK"
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 82001,
	 *    "errmsg": "All touser & toparty & totag invalid"
	 * }
	 */
	public function sendFile($agentid, $media_id, $userList=null, $partyList=null, $tagList=null, $safe=0){
		$sendArr = array();

		if(isset($userList)){
			$sendArr['touser'] = implode('|', $userList);
		}
		if(isset($partyList)){
			$sendArr['toparty'] = implode('|', $partyList);
		}
		if(isset($tagList)){
			$sendArr['totag'] = implode('|', $tagList);
		}
		$sendArr['msgtype'] = 'file';
		$sendArr['agentid'] = $agentid;
		$sendArr['file'] = array('media_id'=>$media_id);
		$sendArr['safe'] = $safe;
		$sendJson = self::jsonencode_unescape($sendArr);

		$url = self::API_URL.$this->m_accessToken;
		$result = HttpCurl::postJson($url, $sendJson);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '发送file消息错误:'.$result);
		}

		return $resultJson;
	}
}
?>