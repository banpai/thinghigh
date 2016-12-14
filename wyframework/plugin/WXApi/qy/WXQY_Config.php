<?php
/**
 * @package		WXQYApi
 * @author		jinye
 * @copyright	Copyright (c) weyue, Inc.
 * @since		Version 1.0.0
 */
include_once "DbCache.class.php";

class WXQY_Config extends DbCache{

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
		$this->m_cache_key = $wid.'/'.$rid.'/WXQY_Config';
		$this->m_monitor_dbs = array('qy_admingroup_config', 'qy_agent_config');
	}

	/*
	 * 获取公众平台上的配置信息
	 * @return 数组
	 */
	public function getConfig(){
		$data = $this->getCache();

		if($data != null){
			return $data;
		}

		$admingroup_config = new Model('qy_admingroup_config');
		$admingroup_config->find(array('wid'=>$this->m_wid, 'rid'=>$this->m_rid));

		if($admingroup_config->has_id()){
			$config = array('corpid'=>$admingroup_config->corpid, 'corpsecret'=>$admingroup_config->corpsecret);


			//获取所有应用配置信息
			$agent_config = new Model('qy_agent_config');
			$agents = $agent_config->where(array('admingroup'=>$admingroup_config->id))->list_all();

			$agentConfig = array();
			foreach($agents as $agent){
				$aConfig = array();
				$aConfig['corpid'] = $config['corpid'];
				$aConfig['agentid'] = $agent->agentid;
				$aConfig['token'] = $agent->token;
				$aConfig['key'] = $agent->key;

				$agentConfig[$agent->agentid] = $aConfig;
			}

			$config['agentConfig'] = $agentConfig;

			$this->setCache($config, 1);
			return $config;
		}

		return null;
	}

	/*
	 * 获取公众平台上的配置信息
	 * @param $agentid int agentid
	 * @return 数组
	 */
	public function getAgentConfig($agentid){
		$config = $this->getConfig();

		if(!isset($config['agentConfig'])){
			return null;
		}

		$agentConfig = $config['agentConfig'];
		if(isset($agentConfig[$agentid])){
			return $agentConfig[$agentid];
		}

		return null;
	}
}
?>