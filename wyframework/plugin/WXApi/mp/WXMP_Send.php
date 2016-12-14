<?php
/**
 * @package		WXMPApi
 * @author		baijuping
 * @copyright	Copyright (c) weyue, Inc.
 * @since		Version 1.0.0
 */
include_once "Base.class.php";

class WXMP_Send extends Base{
	private $m_wid;
	private $m_id;
	
	/**
	 * 构造函数
	 * @param $id int 配置信息id
	 */
	public function __construct($wid, $id)
	{
		$this->m_wid = $wid;
		$this->m_id = $id;
		$this->m_dbs = array('pubs_official');
	}
	
	/*
	 * 获取AccessToken
	 * @return json格式数据
	 * 正确
	 * {"access_token":"ACCESS_TOKEN","expires_in":7200}
	 *
	 * 错误
	 * {"errcode":40013,"errmsg":"invalid appid"}
	 */	
	function setaccesstoken(){
		//检查access_token是否过期，微信官方规定过期时间是2小时，程序中过期时间为1.5小时。
		$dbs = $this->m_dbs;
		$p = new Model($dbs[0]);
		$p->find(array('wid'=>$this->m_wid, 'appid'=>$this->m_id));
		if(!$p->has_id()){
			self::errlog(__METHOD__, func_get_args(), '获取config出错');
			return null; 
		}		
		if($p->flag == 1){
			return $p->accesstoken;
		}		
		$ExpiredTime = time() - 3600*1.5;
		if(trim($p->accesstoken_lastupdate)=='' || floatval(trim($p->accesstoken_lastupdate)) < $ExpiredTime)
		{
			try
			{
				//设定accesstoken更新中
				$p->flag = 1;
				$p->save();
				//access_token过期，重新取得access_token
				$LastUpdateAccessToken = time();
				$resc = HttpCurl::get('https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$p->cusid.'&secret='.$p->cussec, 20);
				if($resc == null || $resc == ''){
					$p->flag = 0;
					$p->save();
				}
				else{
					$resc = json_decode($resc);
					if($res->errcode){
						//错误：调用微信接口的access_token参数从微信服务器取得失败
						self::errlog(__METHOD__, func_get_args(), $res);
						return null;
					}
					$tk = $res->access_token;
					$p->accesstoken = $tk;
					$p->accesstoken_lastupdate = $LastUpdateAccessToken;
					$p->flag = 0;
					$p->save();
				}
			}
			catch(Exception $e){
				$p->flag = 0;
				$p->save();
			}
		}
		else
		{
			//access_token未过期，直接从DB中读取
			$tk = $p->accesstoken;
		}
		return $tk;
	}
	
	/*
	 * 获取网页授权获取用户基本信息
	 * @return json格式数据
	 * 正确
	 * {
     *   "access_token":"ACCESS_TOKEN",
     *   "expires_in":7200,
     *   "refresh_token":"REFRESH_TOKEN",
     *   "openid":"OPENID",
     *   "scope":"SCOPE",
     *   "unionid": "o6_bmasdasdsad6_2sgVt7hMZOPfL"
     * }
	 *
	 * 错误
	 * {"errcode":40029,"errmsg":"invalid code"}
	 */
	function wx_access(){
		if(Conf::$is_developing){
			if(Request::get('wxid')){
				Session::set('wxid',Request::get('wxid'));
			}
			return;
		}
		if(!Session::has('wxid')){
			$dbs = $this->m_dbs;
			$p = new Model($dbs[0]);
			$p->find(array('wid'=>$this->m_wid, 'appid'=>$this->m_id));
			if(!$p->has_id()){
				self::errlog(__METHOD__, func_get_args(), '获取config出错');
				return null;
			}
			$selfurl = Conf::$http_path.$_SERVER["REQUEST_URI"];
			$redirecturl = Conf::$http_path.'wxoauth.html';
			Session::set('redirecturl',$selfurl);
			$requrl = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$p->cusid.'&redirect_uri='.urlencode($redirecturl).'&response_type=code&scope=snsapi_base&state=1#wechat_redirect';
			Redirect::to($requrl);
		}
	}
	
	/*
	 * 获取用户基本信息
	 * @return json格式数据
	 * 正确
	 * {
	 *    "subscribe": 1, 
	 *    "openid": "o6_bmjrPTlm6_2sgVt7hMZOPfL2M", 
	 *    "nickname": "Band", 
	 *    "sex": 1, 
	 *    "language": "zh_CN", 
	 *    "city": "广州", 
	 *    "province": "广东", 
	 *    "country": "中国", 
	 *    "headimgurl":    "http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/0", 
	 *    "subscribe_time": 1382694957,
	 *    "unionid": " o6_bmasdasdsad6_2sgVt7hMZOPfL"
	 *    "remark": "",
	 *    "groupid": 0
	 * }
	 *
	 * 错误
	 * {"errcode":40013,"errmsg":"invalid appid"}
	 */
	function wx_getBaseInfo($openid){
		$ret = array();
		$ret['isfollow'] = 0;
		$ret['info'] = null;
		$accesstoken = self::setaccesstoken();
		$requrl = 'https://api.weixin.qq.com/cgi-bin/user/info?access_token='.$accesstoken.'&openid='.$openid.'&lang=zh_CN';
		$sres = HttpCurl::get_contents($requrl);
		$reds = json_decode($sres);
		if($reds->errcode == ''){
			//判断是否关注
			if('0' != $reds->subscribe && '' != $reds->subscribe){
				$ret['isfollow'] = 1;
			}
			$ret['info'] = $reds;
		}
		else{
			self::errlog(__METHOD__, func_get_args(), $sres);
		}
		return $ret;
	}
	
	/*
	 * 取得权限签名
	 * @return json格式数据
	 * 正确
	 * {
	 *   "errcode":0,
	 *   "errmsg":"ok",
	 *   "ticket":"bxLdikRXVbTPdHSM05e5u5sUoXNKd8-41ZO3MhKoyN5OfkWITDGgnr2fwJ0m9E8NYzWKVZvdVtaUgWvsdshFKA",
	 *   "expires_in":7200
	 * }
	 *
	 * 错误
	 * {"errcode":40001,"errmsg":"invalid credential, access_token is invalid or not latest"}
	 */
	function setJsApiTicket(){
		//取得access_tocken
		$accessToken = self::setaccesstoken();
		//检查jsapi_ticket是否过期，微信官方规定过期时间是2小时，程序中过期时间为1.5小时。
		$dbs = $this->m_dbs;
		$p = new Model($dbs[0]);
		$p->find(array('wid'=>$this->m_wid, 'appid'=>$this->m_id));
		if($p->flag == 1){
			return $p->jsapiticket;
		}
		$ExpiredTime = time() - 3600*1.5;
		if(trim($p->jsapiticket_lastupdate)=='' || floatval(trim($p->jsapiticket_lastupdate)) < $ExpiredTime)
		{
			try{
				//设定jsapi_ticket更新中
				$p->flag = 1;
				$p->save();
				//jsapi_ticket过期，重新取得jsapi_ticket
				$LastUpdateJsApiTicket = time();
				$resc = HttpCurl::get('https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token='.$accessToken, 20);
				if($resc == null || $resc == ''){
					$p->flag = 0;
					$p->save();
				}
				else{
					$res = json_decode($resc);
					if($res->errcode){
						//错误：调用微信接口的jsapi_ticket参数从微信服务器取得失败
						self::errlog(__METHOD__, func_get_args(), $res);
						return null;
					}
					$tk = $res->ticket;
					$p->jsapiticket = $tk;
					$p->jsapiticket_lastupdate = $LastUpdateJsApiTicket;
					$p->flag = 0;
					$p->save();
				}
			}
			catch(Exception $e){
				$p->flag = 0;
				$p->save();
			}
		}
		else
		{
			//jsapi_ticket未过期，直接从DB中读取
			$tk = $p->jsapiticket;
		}
		return $tk;
	}
	
	/**
	 * 发送模板消息
	 *
	 * @access public
	 * @param array $data
	 * @return string
	 *
	 */
	function sendTemplet($data) {
		$postdata = json_encode($data);
		$accesstoken = self::setaccesstoken();
		$requrl = "https://api.weixin.qq.com/cgi-bin/message/template/send?access_token=".$accesstoken;
		$sres = HttpCurl::post($requrl, $postdata);
		$reds = json_decode($sres);
		if($reds->errcode == 0){
			return true;
		}
		else{
			self::errlog(__METHOD__, func_get_args(), $sres);
			return false;
		}
	}
	
	/**
	 * 取得永久二维码的tickit
	 *
	 * @access public
	 * @param string $qrcodeid 永久二维码id
	 * @return string
	 *
	 */
	function getQrcodeTickit($qrcodeid) {
		$ticket = '';
		$dbs = $this->m_dbs;
		$p = new Model($dbs[0]);
		$p->find(array('wid'=>$this->m_wid, 'appid'=>$this->m_id));
		if($p->flag == 1){
			return $p->jsapiticket;
		}
		$tk = self::setaccesstoken();
		$url = 'https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token='.$tk;
		$qrstr = '{"action_name": "QR_LIMIT_SCENE", "action_info": {"scene": {"scene_id": '. $qrcodeid  . '}}}';
		$sres = HttpCurl::post($url, $qrstr);
		$res = json_decode($sres);
		if($res->errcode){
			//从微信服务器调用接口生成二维码ticket失败
			self::errlog(__METHOD__, func_get_args(), $res);
		}
		else{
			$ticket = $res->ticket;
		}		
		return $ticket;
	}
	
	/**
	 * 发布菜单
	 *
	 * @access public
	 * @param array $menu 菜单信息
	 * @return bool
	 *
	 */
	function creatMenu($menu) {
		$tk = self::setaccesstoken();
		$url = 'https://api.weixin.qq.com/cgi-bin/menu/create?access_token='.$tk;
		if(!isset($menu['button'])){
			$sendJson = json_encode(array('button'=>$menu));
		}
		else{
			$sendJson = json_encode($menu);
		}
		$cdred = HttpCurl::post($url,urldecode($sendJson));
		$res = json_decode($cdred);
		if($res->errcode !='0'){
			self::errlog(__METHOD__, func_get_args(), $res);
			return false;
		}else{
			return true;
		}
	}
	
	/**
	 * 删除菜单
	 *
	 * @access public
	 * @param 参数
	 * @return bool
	 *
	 */
	function deleteMenu() {
		$tk = self::setaccesstoken();
		$url = 'https://api.weixin.qq.com/cgi-bin/menu/delete?access_token='.$tk;
		$result = HttpCurl::get_contents($url);
		$resultJson = json_decode($result);
		if($res->errcode !='0'){
			self::errlog(__METHOD__, func_get_args(), $res);
			return false;
		}else{
			return true;
		}
	}
	
	/**
	 * 发送消息
	 *
	 * @access public
	 * @param 
	 * @return bool
	 *
	 */
	function sendMessage($userid, $content) {
		$accesstoken = self::setaccesstoken();
		$sendmsg = '{"touser":"'.$userid.'","msgtype":"text","text":{"content":"'.$content.'"}}';
		$kfurl = 'https://api.weixin.qq.com/cgi-bin/message/custom/send?access_token=' . $accesstoken;
		$sres = HttpCurl::post($kfurl, $sendmsg);
		$res = json_decode($sres);
		if (intval($res->errcode) == 0) {
			return true;
		}
		else{
			self::errlog(__METHOD__, func_get_args(), $sres);
			return false;
		}
	}
	
	/**
	 * 下载多媒体图片
	 *
	 * @access public
	 * @param
	 * @return path
	 *
	 */
	function downloadMedia($media_id, $path) {
		$ret = "";
		$accesstoken = self::setaccesstoken();
		$url = 'http://file.api.weixin.qq.com/cgi-bin/media/get?access_token='.$accesstoken.'&media_id='.$media_id;
		$ch = curl_init($url);
		curl_setopt($ch, CURLOPT_HEADER, 0);
		curl_setopt($ch, CURLOPT_NOBODY, 0);    //对body进行输出。
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
		$package = curl_exec($ch);
		$httpinfo = curl_getinfo($ch);	
		curl_close($ch);
		$media = array_merge(array('mediaBody' => $package), $httpinfo);
		if($media["http_code"] == '200'){
			//求出文件格式
			$items = explode(";",$media["content_type"]);
			$types = explode("/",$items[0]);
			if($types[1] == 'jpeg'){
				$fileExt = 'jpg';
			}
			else{
				$fileExt = $types[1];
			}
			$filename = time().rand(100,999).".{$fileExt}";
			file_put_contents($path.$filename,$media['mediaBody']);
			$fullpath = $path.$filename;
			$ret = $filename;
		}
		return $ret;
	}
}