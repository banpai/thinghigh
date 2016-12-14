<?php
/**
 * 日志记录
 * @author mqq
 *
 */
class Log{
	/**
	 * 调试记录
	 * @param $str  string 错误内容
	 * @param $args array 参数
	 * @param $methodName string 错误发生路径
	 */
	public static function debug($str, $args=null, $methodName=''){
		if(Conf::$log_level>3)
		self::writeLog('debug', $str, $args, $methodName);
	}
	/**
	 * 信息记录
	 * @param $str  string 错误内容
	 * @param $args array 参数
	 * @param $methodName string 错误发生路径
	 */
	public static function info($str, $args=null, $methodName=''){
		if(Conf::$log_level>2)
		self::writeLog('info', $str, $args, $methodName);
	}
	/**
	 * 警告记录
	 * @param $str  string 错误内容
	 * @param $args array 参数
	 * @param $methodName string 错误发生路径
	 */
	public static function warn($str, $args=null, $methodName=''){
		if(Conf::$log_level>1)
		self::writeLog('warn', $str, $args, $methodName);
	}
	/**
	 * 错误记录
	 * @param $str  string 错误内容
	 * @param $args array 参数
	 * @param $methodName string 错误发生路径
	 */
	public static function error($str, $args=null, $methodName=''){
		if(Conf::$log_level>0)
		self::writeLog('error', $str, $args, $methodName);
	}

	private static function writeLog($type, $str, $args=null, $methodName=''){
		$content =  $str;
		if($methodName != ''){
			$content = $content . "\n" . $methodName;
		}
		if(isset($args)){
			$content = $content . "\n" . var_export($args, true);
		}

		file_put_contents(WYF_FRAME_PATH.'/log/'.$type.'/'.date('Y_m_d',time()).'.log', date('H:i:s',time()).': '.$content."\n",FILE_APPEND);
	}
}
?>