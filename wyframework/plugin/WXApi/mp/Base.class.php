<?php
/**
 * @package		WXQYApi
 * @author		jinye
 * @copyright	Copyright (c) weyue, Inc.
 * @since		Version 1.0.0
 */
abstract class Base {
	/**
	 * 解析querystring
	 * @param $url string url
	 * @return array 参数数组
	 */
	public static function parseQueryString($url){
		$pos = strrpos($url, '?');
		if(!$pos){
			return null;
		}

		$queryString = substr($url, $pos+1);
		$params = explode('&', $queryString);
		$paramArray = array();

		foreach ($params as $param) {
			$pair =  explode('=', $param);
			$paramArray[$pair[0]] = urldecode($pair[1]);
		}

		return $paramArray;
	}


	/**
	 * 写errorlog
	 * @param $methodName string 方法名
	 * @param $args array 方法参数
	 * @param $error string 错误内容
	 */
	protected static function errlog($methodName, $args, $error){
		$errContent =  $methodName.' '.$error.' 参数:'.PHP_EOL.var_export($args, true);
		Log::error($errContent);
	}
}
?>