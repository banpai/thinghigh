<?php
/**
 * @package		WXQYApi
 * @author		jinye
 * @copyright	Copyright (c) weyue, Inc.
 * @since		Version 1.0.0
 */
include_once "DbCache.class.php";
include_once "WXQY_Error.class.php";

class WXQY_Contact extends DbCache{

	public $m_wid;
	public $m_rid;
	public $m_accessToken;

	const DEPARTMENT_API_URL = 'https://qyapi.weixin.qq.com/cgi-bin/department/%s?access_token=%s';
	const USER_API_URL = 'https://qyapi.weixin.qq.com/cgi-bin/user/%s?access_token=%s';
	const TAG_API_URL = 'https://qyapi.weixin.qq.com/cgi-bin/tag/%s?access_token=%s';

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
	 * 创建部门
	 * @param $department array 部门内容数组
	 * 数组成员
	 * {
	 *    "id": "1"
	 *    "name": "广州研发中心",
	 *    "parentid": "1",
	 *    "order": "1",
	 * }
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": "0",
	 *    "errmsg": "created",
	 *    "id": 2
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 82001,
	 *    "errmsg": "All touser & toparty & totag invalid"
	 * }
	 */
	public function createDepartment($department){
		$sendJson = self::jsonencode_unescape($department);

		$url = sprintf(self::DEPARTMENT_API_URL, 'create', $this->m_accessToken);
		$result = HttpCurl::postJson($url, $sendJson);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '创建部门错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 更新部门
	 * @param $department array 部门内容数组
	 * 数组成员
	 * {
	 *    "id": "1"
	 *    "name": "广州研发中心",
	 *    "parentid": "1",
	 *    "order": "1",
	 * }
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": "0",
	 *    "errmsg": "updated"
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 82001,
	 *    "errmsg": "All touser & toparty & totag invalid"
	 * }
	 */
	public function updateDepartment($department){
		$sendJson = self::jsonencode_unescape($department);

		$url = sprintf(self::DEPARTMENT_API_URL, 'update', $this->m_accessToken);
		$result = HttpCurl::postJson($url, $sendJson);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '更新部门错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 删除部门
	 * @param $depid int 部门id
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": "0",
	 *    "errmsg": "deleted"
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 82001,
	 *    "errmsg": "All touser & toparty & totag invalid"
	 * }
	 */
	public function deleteDepartment($depid){
		$url = sprintf(self::DEPARTMENT_API_URL, 'delete', $this->m_accessToken).'&id='.$depid;
		$result = HttpCurl::get_contents($url);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '删除部门错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 获取部门列表
	 * @param $depid int 部门id
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": 0,
	 *    "errmsg": "ok",
	 *    "department": [
	 *        {
	 *            "id": 2,
	 *            "name": "广州研发中心",
	 *            "parentid": 1,
	 *            "order": 10
	 *        },
	 *        {
	 *            "id": 3
	 *            "name": "邮箱产品部",
	 *            "parentid": 2,
	 *            "order": 40
	 *        }
	 *    ]
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 82001,
	 *    "errmsg": "All touser & toparty & totag invalid"
	 * }
	 */
	public function getDepartment($depid){
		$url = sprintf(self::DEPARTMENT_API_URL, 'list', $this->m_accessToken).'&id='.$depid;
		$result = HttpCurl::get_contents($url);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '获取部门列表错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 创建成员
	 * @param $user array 成员内容数组
	 * 数组成员
	 * {
	 *    "userid": "zhangsan",
	 *    "name": "张三",
	 *    "department": [1, 2],
	 *    "position": "产品经理",
	 *    "mobile": "15913215421",
	 *    "gender": "1",
	 *    "email": "zhangsan@gzdev.com",
	 *    "weixinid": "zhangsan4dev",
	 *    "avatar_mediaid": "2-G6nrLmr5EC3MNb_-zL1dDdzkd0p7cNliYu9V5w7o8K0",
	 *    "extattr": {"attrs":[{"name":"爱好","value":"旅游"},{"name":"卡号","value":"1234567234"}]}
	 * }
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": "0",
	 *    "errmsg": "created",
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 82001,
	 *    "errmsg": "All touser & toparty & totag invalid"
	 * }
	 */
	public function createUser($user){
		$sendJson = self::jsonencode_unescape($user);

		$url = sprintf(self::USER_API_URL, 'create', $this->m_accessToken);
		$result = HttpCurl::postJson($url, $sendJson);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '创建成员错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 更新成员
	 * @param $user array 成员内容数组
	 * 数组成员
	 * {
	 *    "userid": "zhangsan",
	 *    "name": "张三",
	 *    "department": [1, 2],
	 *    "position": "产品经理",
	 *    "mobile": "15913215421",
	 *    "gender": "1",
	 *    "email": "zhangsan@gzdev.com",
	 *    "weixinid": "zhangsan4dev",
	 *    "enable": 1,
	 *    "avatar_mediaid": "2-G6nrLmr5EC3MNb_-zL1dDdzkd0p7cNliYu9V5w7o8K0",
	 *    "extattr": {"attrs":[{"name":"爱好","value":"旅游"},{"name":"卡号","value":"1234567234"}]}
	 * }
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": "0",
	 *    "errmsg": "updated",
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 82001,
	 *    "errmsg": "All touser & toparty & totag invalid"
	 * }
	 */
	public function updateUser($user){
		$sendJson = self::jsonencode_unescape($user);

		$url = sprintf(self::USER_API_URL, 'update', $this->m_accessToken);
		$result = HttpCurl::postJson($url, $sendJson);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '更新成员错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 删除成员
	 * @param $userid string 成员id
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": "0",
	 *    "errmsg": "deleted"
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 82001,
	 *    "errmsg": "All touser & toparty & totag invalid"
	 * }
	 */
	public function deleteUser($userid){
		$url = sprintf(self::USER_API_URL, 'delete', $this->m_accessToken).'&userid='.$userid;
		$result = HttpCurl::get_contents($url);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '删除成员错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 批量删除成员
	 * @param $useridlist array 成员UserID列表
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": "0",
	 *    "errmsg": "deleted"
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 82001,
	 *    "errmsg": "All touser & toparty & totag invalid"
	 * }
	 */
	public function batchdeleteUser($useridlist){
		$sendJson = self::jsonencode_unescape(array('useridlist'=>$useridlist));

		$url = sprintf(self::USER_API_URL, 'batchdelete', $this->m_accessToken);
		$result = HttpCurl::postJson($url, $sendJson);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '批量删除成员错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 获取成员
	 * @param $userid string 成员id
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": 0,
	 *    "errmsg": "ok",
	 *    "userid": "zhangsan",
	 *    "name": "李四",
	 *    "department": [1, 2],
	 *    "position": "后台工程师",
	 *    "mobile": "15913215421",
	 *    "gender": "1",
	 *    "email": "zhangsan@gzdev.com",
	 *    "weixinid": "lisifordev",
	 *    "avatar": "http://wx.qlogo.cn/mmopen/ajNVdqHZLLA3WJ6DSZUfiakYe37PKnQhBIeOQBO4czqrnZDS79FH5Wm5m4X69TBicnHFlhiafvDwklOpZeXYQQ2icg/0",//头像url。注：如果要获取小图将url最后的"/0"改成"/64"即可
	 *    "status": 1,//关注状态: 1=已关注，2=已冻结，4=未关注
	 *    "extattr": {"attrs":[{"name":"爱好","value":"旅游"},{"name":"卡号","value":"1234567234"}]}
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 82001,
	 *    "errmsg": "All touser & toparty & totag invalid"
	 * }
	 */
	public function getUser($userid){
		$url = sprintf(self::USER_API_URL, 'get', $this->m_accessToken).'&userid='.$userid;
		$result = HttpCurl::get_contents($url);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '获取成员错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 获取部门成员
	 * @param $depid int 获取的部门id
	 * @param $fetchChild int 1/0：是否递归获取子部门下面的成员，默认0
	 * @param $status string 0获取全部成员，1获取已关注成员列表，2获取禁用成员列表，4获取未关注成员列表。status可叠加，默认0
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": 0,
	 *    "errmsg": "ok",
	 *    "userlist": [
	 *            {
	 *                   "userid": "zhangsan",
	 *                   "name": "李四"
	 *            }
	 *      ]
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 82001,
	 *    "errmsg": "All touser & toparty & totag invalid"
	 * }
	 */
	public function getSimplelist($depid, $fetchChild=0, $status=0){
		$url = sprintf(self::USER_API_URL, 'simplelist', $this->m_accessToken).'&department_id='.$depid.'&fetch_child='.$fetchChild.'&status='.$status;
		$result = HttpCurl::get_contents($url);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '获取部门成员错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 获取部门成员(详情)
	 * @param $depid int 获取的部门id
	 * @param $fetchChild int 1/0：是否递归获取子部门下面的成员，默认0
	 * @param $status string 0获取全部成员，1获取已关注成员列表，2获取禁用成员列表，4获取未关注成员列表。status可叠加，默认0
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": 0,
	 *    "errmsg": "ok",
	 *    "userlist": [
	 *            {
	 *                   "userid": "zhangsan",
	 *                   "name": "李四",
	 *                   "department": [1, 2],
	 *                   "position": "后台工程师",
	 *                   "mobile": "15913215421",
	 *                   "gender": "1",
	 *                   "email": "zhangsan@gzdev.com",
	 *                   "weixinid": "lisifordev",
	 *                   "avatar":           "http://wx.qlogo.cn/mmopen/ajNVdqHZLLA3WJ6DSZUfiakYe37PKnQhBIeOQBO4czqrnZDS79FH5Wm5m4X69TBicnHFlhiafvDwklOpZeXYQQ2icg/0",
	 *                   "status": 1,
	 *                   "extattr": {"attrs":[{"name":"爱好","value":"旅游"},{"name":"卡号","value":"1234567234"}]}
	 *            }
	 *      ]
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 82001,
	 *    "errmsg": "All touser & toparty & totag invalid"
	 * }
	 */
	public function getList($depid, $fetchChild=0, $status=0){
		$url = sprintf(self::USER_API_URL, 'list', $this->m_accessToken).'&department_id='.$depid.'&fetch_child='.$fetchChild.'&status='.$status;
		$result = HttpCurl::get_contents($url);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '获取部门成员(详情)错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 邀请成员关注
	 * @param $userid string 成员id
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": 0,
	 *    "errmsg": "ok",
	 *    "type": 1 //1:微信邀请 2.邮件邀请
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 82001,
	 *    "errmsg": "All touser & toparty & totag invalid"
	 * }
	 */
	public function invite($userid){
		$sendJson = self::jsonencode_unescape(array('userid'=>$userid));

		$url = 'https://qyapi.weixin.qq.com/cgi-bin/invite/send?access_token='.$this->m_accessToken;
		$result = HttpCurl::postJson($url, $sendJson);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '邀请成员关注错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 创建标签
	 * @param $tag array 标签内容数组
	 * 数组成员
	 * {
	 *    "tagid": id
	 *    "tagname": "开发组"
	 * }
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": "0",
	 *    "errmsg": "created",
	 *    "tagid": 1
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 40070,
	 *    "errmsg": "all list invalid"
	 * }
	 */
	public function createTag($tag){
		$sendJson = self::jsonencode_unescape($tag);

		$url = sprintf(self::TAG_API_URL, 'create', $this->m_accessToken);
		$result = HttpCurl::postJson($url, $sendJson);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '创建标签错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 更新标签名字
	 * @param $tag array 标签内容数组
	 * 数组成员
	 * {
	 *    "tagid": id
	 *    "tagname": "开发组"
	 * }
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": "0",
	 *    "errmsg": "updated"
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 40070,
	 *    "errmsg": "all list invalid"
	 * }
	 */
	public function updateTag($tag){
		$sendJson = self::jsonencode_unescape($tag);

		$url = sprintf(self::TAG_API_URL, 'update', $this->m_accessToken);
		$result = HttpCurl::postJson($url, $sendJson);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '更新标签名字错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 删除标签
	 * @param $tagid int 标签id
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": "0",
	 *    "errmsg": "deleted"
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 40070,
	 *    "errmsg": "all list invalid"
	 * }
	 */
	public function deleteTag($tagid){
		$url = sprintf(self::TAG_API_URL, 'delete', $this->m_accessToken).'&tagid='.$tagid;
		$result = HttpCurl::get_contents($url);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '删除标签错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 获取标签成员
	 * @param $tagid int 标签id
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": 0,
	 *    "errmsg": "ok",
	 *    "userlist": [
	 *          {
	 *              "userid": "zhangsan",
	 *              "name": "李四"
	 *          }
	 *      ],
	 *    "partylist": [2]
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 40070,
	 *    "errmsg": "all list invalid"
	 * }
	 */
	public function getTaguser($tagid){
		$url = sprintf(self::TAG_API_URL, 'get', $this->m_accessToken).'&tagid='.$tagid;
		$result = HttpCurl::get_contents($url);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '获取标签成员错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 增加标签成员
	 * @param $tagusers array 标签成员
	 * 数组成员
	 * {
	 *    "tagid": "1",
	 *    "userlist":[ "user1","user2"],
	 *    "partylist": [4]
	 * }
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": 0,
	 *    "errmsg": "ok"
	 * }
	 *
	 * 错误
	 * 若部分userid、partylist非法，则返回
	 * {
	 *    "errcode": 40070,
	 *    "errmsg": "错误消息",
	 *    "invalidlist"："usr1|usr2|usr",
	 *    "invalidparty"：[2,4]
	 * }
	 *
	 * 当包含userid、partylist全部非法时返回
	 * {
	 *    "errcode": 40070,
	 *    "errmsg": "all list invalid"
	 * }
	 */
	public function addTaguser($tagusers){
		$sendJson = self::jsonencode_unescape($tag);

		$url = sprintf(self::TAG_API_URL, 'addtagusers', $this->m_accessToken);
		$result = HttpCurl::postJson($url, $sendJson);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '增加标签成员错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 删除标签成员
	 * @param $tagusers array 标签成员
	 * 数组成员
	 * {
	 *    "tagid": "1",
	 *    "userlist":[ "user1","user2"],
	 *    "partylist": [4]
	 * }
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": 0,
	 *    "errmsg": "ok"
	 * }
	 *
	 * 错误
	 * 若部分userid、partylist非法，则返回
	 * {
	 *    "errcode": 40070,
	 *    "errmsg": "错误消息",
	 *    "invalidlist"："usr1|usr2|usr",
	 *    "invalidparty"：[2,4]
	 * }
	 *
	 * 当包含userid、partylist全部非法时返回
	 * {
	 *    "errcode": 40070,
	 *    "errmsg": "all list invalid"
	 * }
	 */
	public function deleteTaguser($tagusers){
		$sendJson = self::jsonencode_unescape($tag);

		$url = sprintf(self::TAG_API_URL, 'deltagusers', $this->m_accessToken);
		$result = HttpCurl::postJson($url, $sendJson);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '删除标签成员错误:'.$result);
		}

		return $resultJson;
	}

	/**
	 * 获取标签列表
	 *
	 * @return json数组
	 * 正确
	 * {
	 *    "errcode": 0,
	 *    "errmsg": "ok",
	 *    "taglist":[
	 *       {"tagid":1,"tagname":"a"},
	 *       {"tagid":2,"tagname":"b"}
	 *    ]
	 * }
	 *
	 * 错误
	 * {
	 *    "errcode": 40014,
	 *    "errmsg": "invalid access_token"
	 * }
	 */
	public function getTag(){
		$url = sprintf(self::TAG_API_URL, 'list', $this->m_accessToken);
		$result = HttpCurl::get_contents($url);
		$resultJson = json_decode($result, true);

		if($resultJson['errcode'] != 0){
			$resultJson['errmsg'] = WXQY_Error::getErrmsg($resultJson['errcode']);
			self::errlog(__METHOD__, func_get_args(), '获取标签列表错误:'.$result);
		}

		return $resultJson;
	}
}
?>