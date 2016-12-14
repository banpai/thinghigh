<?php
/**
 * @package		WXQYApi
 * @author		jinye
 * @copyright	Copyright (c) weyue, Inc.
 * @since		Version 1.0.0
 */
include_once "Base.class.php";

class WXQY_Auth extends Base{

	public $m_wid;
	public $m_rid;
	public $m_config;
	public $m_accessToken;

	/**
	 * 构造函数
	 * @param $wid int 站点id
	 * @param $rid string 识别id
	 */
	public function __construct($wid, $rid)
	{
		$this->m_wid = $wid;
		$this->m_aid = $rid;

		$wxqy_config = new WXQY_Config($wid, $rid);
		$wxqy_accessToken = new WXQY_AccessToken($wid, $rid);

		$this->m_config = $wxqy_config->getConfig();
		$this->m_accessToken = $wxqy_accessToken->getAccessToken();
	}

	public function wx_access(){
		if(Conf::$is_developing){
			if(Request::get('qyid')){
				Session::set('qyid',Request::get('qyid'));
			}
			return;
		}
		if(!Session::has('qyid')){
			$selfurl = Conf::$http_path.$_SERVER["REQUEST_URI"];
			$redirecturl = Conf::$http_path.'qyoauth.html';
			Session::set('redirecturl',$selfurl);
			$requrl = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$this->m_config['corpid'].'&redirect_uri='.urlencode($redirecturl).'&response_type=code&scope=snsapi_base&state=1#wechat_redirect';
			Redirect::to($requrl);
		}
	}
}
?>