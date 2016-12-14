<?php
/**
 * @package		WXQYApi
 * @author		jinye
 * @copyright	Copyright (c) weyue, Inc.
 * @since		Version 1.0.0
 */
include_once "Base.class.php";
include_once "WXQY_Error.class.php";

class WXQY_Menu extends Base{

	public $m_wid;
	public $m_rid;
	public $m_accessToken;

	const API_URL = 'https://qyapi.weixin.qq.com/cgi-bin/menu/%s?access_token=%s&agentid=%s';

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
	 * 获取菜单列表
	 * @param $agentid int 应用id
	 * @return json数组
	 * 正确
	 * {
	 *    "button":[
	 *        {
	 *            "type":"click",
	 *            "name":"今日歌曲",
	 *            "key":"V1001_TODAY_MUSIC"
	 *        },
	 *        {
	 *            "name":"菜单",
	 *            "sub_button":[
	 *                {
	 *                    "type":"view",
	 *                    "name":"搜索",
	 *                    "url":"http://www.soso.com/"
	 *                },
	 *                {
	 *                    "type":"click",
	 *                    "name":"赞一下我们",
	 *                    "key":"V1001_GOOD"
	 *                }
	 *            ]
	 *       }
	 *    ]
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 41011,
	 *    "errmsg": "missing agentid"
	 * }
	 */
	public function getMenu($agentid){
		$url = sprintf(self::API_URL, 'get', $this->m_accessToken, $agentid);

		$result = HttpCurl::get_contents($url);
		$resultJson = json_decode($result, true);

		if(isset($resultJson['errcode'])){
			self::errlog(__METHOD__, func_get_args(), '获取菜单列表错误:'.$result);
		}

		return $resultJson['menu'];
	}

	/**
	 * 创建应用菜单
	 * @param $agentid int 应用id
	 * @param $menulist array 菜单数组
	 * {
	 *    "button":[
	 *        {
	 *            "type":"click",
	 *            "name":"今日歌曲",
	 *            "key":"V1001_TODAY_MUSIC"
	 *        },
	 *        {
	 *            "name":"菜单",
	 *            "sub_button":[
	 *                {
	 *                    "type":"view",
	 *                    "name":"搜索",
	 *                    "url":"http://www.soso.com/"
	 *                },
	 *                {
	 *                    "type":"click",
	 *                    "name":"赞一下我们",
	 *                    "key":"V1001_GOOD"
	 *                }
	 *            ]
	 *       }
	 *    ]
	 * }
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": 0,
	 *    "errmsg": "ok"
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 41011,
	 *    "errmsg": "missing agentid"
	 * }
	 */
	public function createMenu($agentid, $menulist){
		if(!isset($menulist['button'])){
			$sendJson = self::jsonencode_unescape(array('button'=>$menulist));
		}
		else{
			$sendJson = self::jsonencode_unescape($menulist);
		}

		$url = sprintf(self::API_URL, 'create', $this->m_accessToken, $agentid);
		$result = HttpCurl::postJson($url, $sendJson);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '创建应用菜单错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 获取菜单列表
	 * @param $agentid int 应用id
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": 0,
	 *    "errmsg": "ok"
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 41011,
	 *    "errmsg": "missing agentid"
	 * }
	 */
	public function deleteMenu($agentid){
		$url = sprintf(self::API_URL, 'delete', $this->m_accessToken, $agentid);

		$result = HttpCurl::get_contents($url);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '删除菜单错误:'.$result);
		}

		return $resultJson;
	}
}
?>