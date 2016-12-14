<?php
/**
 * @package		WXQYApi
 * @author		jinye
 * @copyright	Copyright (c) weyue, Inc.
 * @since		Version 1.0.0
 */
include_once "WXBizMsgCrypt/WXBizMsgCrypt.php";
include_once "DbCache.class.php";

class WXQY_AccessToken extends DbCache{

	private $m_wid;
	private $m_rid;

	/**
	 * 构造函数
	 * @param $wid int 站点id
	 * @param $rid string 识别id
	 */
	public function __construct($wid, $rid)
	{
		$this->m_wid = $wid;
		$this->m_rid = $rid;
		$this->m_cache_key = $wid.'/'.$rid.'/WXQY_AccessToken';
		$this->m_monitor_dbs = array('qy_admingroup_config');
	}

	/*
	* 获取AccessToken
	* @param $wid int 站点id
	* @return json数组
	* 正确
	* {
	*     "access_token": "accesstoken000001",
	*     "expires_in": 7200
	* }
	*
	* 错误
	* {
	*     "errcode": 43003,
	*     "errmsg": "require https"
	* }
	*/
	public function getAccessToken($force=false){
		$data = $this->getCache();

		if($data != null){
			return $data;
		}

		$apiurl = 'https://qyapi.weixin.qq.com/cgi-bin/gettoken';
		$wxqy_config = new WXQY_Config($this->m_wid, $this->m_rid);
		$config = $wxqy_config->getConfig();

		if($config == null){
			self::errlog(__METHOD__, func_get_args(), '获取config出错');
			return null;
		}

		$params = array('corpid'=>$config['corpid'], 'corpsecret'=>$config['corpsecret']);
		$requrl = HttpCurl::combineURL($apiurl, $params);
		$result = HttpCurl::get_contents($requrl);
		$resultJson = json_decode($result, true);
		$accessToken = '';

		if(isset($resultJson['errcode'])){
			self::errlog(__METHOD__, func_get_args(), $result);
		}
		else{
			$accessToken = $resultJson['access_token'];
			$this->setCache($accessToken, 1.5);
		}

		return $accessToken;
	}
}
?>