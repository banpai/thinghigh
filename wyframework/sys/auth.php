<?php
/**
 * 用户认证
 *
 * @author mqq
 *
 */
class Auth{

	/**
	 * 管理员声明
	 * @param mixed $adminlevel 可以不填，管理员级别组(string|array)
	 */
	public static function im_admin($adminlevel=null){
		if($adminlevel==null){
			$adminlevel="WYF-ADMIN:";
		}else{
			//我也是普通admin
			self::im_user("WYF-ADMIN:","WYF-ADMIN:");
		}
		self::im_user($adminlevel,"WYF-ADMIN:");
	}

	/**
	 * 管理员注销声明
	 * @param mixed $adminlevel 可以不填，管理员级别组(string|array)
	 */
	public static function im_notadmin($adminlevel=null){
		if($adminlevel==null){
			$adminlevel="WYF-ADMIN:";
		}
		self::im_notuser($adminlevel,"WYF-ADMIN:");
	}
	/**
	 * 用户声明
	 * @param mixed $userlevel 用户级别(string|array)
	 * @param string $userkey 用户群组
	 */
	public static function im_user($userlevel=null,$userkey='WYF-USER:'){
		if($userlevel==null){
			$userlevel="WYF-USER:";
		}elseif(is_array($userlevel)){
			foreach ($userlevel as $ul){
				self::im_user($ul,$userkey);
			}
		}else{
			//我也是普通用户
			$_SESSION['WYF-USER:WYF-USER:'] = md5('WYF-USER:WYF-USER:');
		}
		$_SESSION[$userkey.$userlevel] = md5($userkey.$userlevel);
		self::set_real_login();
	}

	/**
	 * 用户注销声明
	 * @param mixed $userlevel 用户级别(string|array)
	 * @param string $userkey 用户群组
	 */
	public static function im_notuser($userlevel=null,$userkey='WYF-USER:'){
		if($userlevel==null){
			$userlevel="WYF-USER:";
		}elseif(is_array($userlevel)){
			foreach ($userlevel as $ul){
				self::im_notuser($ul,$userkey);
			}
		}else{
			//不注销普通用户
			//unset($_SESSION['WYF-USER:WYF-USER:']);
		}
		unset($_SESSION[$userkey.$userlevel]);
	}
	/**
	 * 设置session的强制认证模式
	 */
	public static function set_real_login(){
		//强制认证模式授权
		$_SESSION['WYF_REQIP'] = Request::ip();
	}
	/**
	 * 判断用户是否是管理员
	 * @param mixed $adminlevel 管理员级别(string|array)
	 * @return boolean
	 */
	public static function is_admin($adminlevel=null){
		if($adminlevel==null){
			$adminlevel="WYF-ADMIN:";
		}
		return self::is_user($adminlevel,"WYF-ADMIN:");
	}
	/**
	 * 判断用户是否登录
	 * @param mixed $userlevel 用户级别(string|array)
	 * @param string $userkey 用户群组
	 * @return boolean
	 */
	public static function is_user($userlevel=null,$userkey='WYF-USER:'){
		if($_SESSION['WYF_REQIP'] !=Request::ip()){
			return false;
		}

		//WYF_set_real_login();
		if($userlevel==null){
			$userlevel="WYF-USER:";
		}
		if(is_array($userlevel)){
			foreach ($userlevel as $ul){
				if(self::is_user($ul,$userkey)){
					return true;
				}
			}
		}elseif(isset($_SESSION[$userkey.$userlevel]) && $_SESSION[$userkey.$userlevel]==md5($userkey.$userlevel)){
				return true;
		}
		return false;

	}
}