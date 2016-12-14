<?php
class Session{
	/**
	 * Session设置
	 * @param string $k Session键
	 * @param obj $v Session值 传入null则为清空Session
	 * @param bool   $n 是否需要序列化
	 */
	public static function set($k,$v=null,$n=false){
		if($v === null){
			$_SESSION[Conf::$session_prefix.$k] = null;
			unset($_SESSION[Conf::$session_prefix.$k]);
		}else{
			if($n){
				$_SESSION[Conf::$session_prefix.$k] = serialize($v);
			}
			else{
				$_SESSION[Conf::$session_prefix.$k] = $v;
			}
		}
	}

	/**
	 * 安全取得Session内容
	 * @param string $k Session键
	 * @param bool   $n 是否需要反序列化
	 * @return obj Session内容
	 */
	public static function get($k,$n=false,$def=null){
		if(isset($_SESSION[Conf::$session_prefix.$k])){
			$value = $n ? unserialize($_SESSION[Conf::$session_prefix.$k]) : $_SESSION[Conf::$session_prefix.$k];
		}else{
			$value = $def;
		}

		return $value;
	}


	/**
	 * 判断Session是否含有指定内容
	 * @param string $k Session参数
	 * @return boolean
	 */
	public static function has($k){
		if(isset($_SESSION[Conf::$session_prefix.$k])){
			return true;
		}
		return false;
	}

	/**
	 * 删除指定Session内容
	 * @param string $k Session键
	 */
	public static function remove($k){
		return self::set(Conf::$session_prefix.$k);
	}

	/**
	 * 一次性Session显示信息存入
	 * @param string $k Session键
	 * @param obj $v Session值 传入null则为清空Session
	 * @param bool   $n 是否需要序列化
	 */
	public static function once($k,$v=null,$n=false){
		if($v === null){
			$_SESSION[Conf::$session_prefix.'WYF_ONCE_'.$k] = null;
			unset($_SESSION[Conf::$session_prefix.'WYF_ONCE_'.$k]);
		}else{
			if($n){
				$_SESSION[Conf::$session_prefix.'WYF_ONCE_'.$k] = serialize($v);
			}
			else{
				$_SESSION[Conf::$session_prefix.'WYF_ONCE_'.$k] = $v;
			}
		}
	}

	/**
	 * 取得Session一次性显示内容
	 * @param string $k Session参数
	 * @param bool   $n 是否需要反序列化
	 * @return obj Session内容
	 */
	public static function flush($k){
		if(isset($_SESSION[Conf::$session_prefix.'WYF_ONCE_'.$k])){
			if($n){
				$msg = unserialize($_SESSION[Conf::$session_prefix.'WYF_ONCE_'.$k]);
			}
			else{
				$msg = $_SESSION[Conf::$session_prefix.'WYF_ONCE_'.$k];
			}
			self::once($k);
			return $msg;
		}
		return null;
	}

	/**
	 * 判断Session是否含有一次性显示内容
	 * @param string $k Session参数
	 * @return boolean
	 */
	public static function hold($k){
		if(isset($_SESSION[Conf::$session_prefix.'WYF_ONCE_'.$k])){
			return true;
		}
		return false;
	}

	/**
	 * 清空Session
	 */
	public static function clear(){
		foreach ($_SESSION as $k=>$v){
			$_SESSION[$k] = null;
			unset($_SESSION[$k]);
		}
	}
}