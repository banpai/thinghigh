<?php
/**
 * @package		WXQYApi
 * @author		jinye
 * @copyright	Copyright (c) weyue, Inc.
 * @since		Version 1.0.0
 */
include_once "Base.class.php";

abstract class DbCache extends Base{
	protected $m_cache_enabled = true;
	protected $m_cache_key;
	protected $m_monitor_dbs = array();

	/*
	 * 获取缓存数据
	 */
	protected function getCache(){
		$cacheData = null;
		if(Conf::$is_developing || !$this->m_cache_enabled){
			return null;
		}

		if(Cache::has($this->m_cache_key)){
			$cacheData = Cache::get($this->m_cache_key);
		}
		else{
			return null;
		}

		$available = $this->checkMonitorDb($cacheData['createtime']);

		if($available){
			return $cacheData['data'];
		}
		else{
			return null;
		}
	}

	/*
	 * 设置缓存数据
	 * @param $data mx 要缓存的数据
	 * @param $time int 缓存时间,单位：小时
	 */
	protected function setCache($data, $time=0){
		if(Conf::$is_developing || !$this->m_cache_enabled){
			return;
		}

		if(isset($data)){
			$cacheData = array('createtime'=>time(), 'data'=>$data);
			Cache::set($this->m_cache_key, $cacheData, $time);
		}
	}

	/*
	 * 检查数据库最后更新时间
	 * @param $cachetime int 缓存数据生成的时间
	 * @return bool true:缓存有效
	 */
	protected function checkMonitorDb($cachetime){
		$available = true;
		foreach ($this->m_monitor_dbs as $db){
			if(Cache::has('WYF_TABLE_TIME'.Conf::$db_tablePrefix.$db) && intval(Cache::get('WYF_TABLE_TIME'.Conf::$db_tablePrefix.$db)) >= $cachetime){
				//如果某一库表的更新时间大于等于缓存时间
				$available = false;
				break;
			}
		}

		return 	$available;
	}
}
?>