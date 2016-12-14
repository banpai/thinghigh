<?php
/**
 * @package		WXQYApi
 * @author		jinye
 * @copyright	Copyright (c) weyue, Inc.
 * @since		Version 1.0.0
 */
include_once "Base.class.php";
include_once "WXBizMsgCrypt/WXBizMsgCrypt.php";

class WXQY_Receive extends Base{

	public $m_wid;//站点id
	public $m_rid;//识别id
	public $m_aid;//应用id
	public $m_config;//站点配置，包含站点应用配置
	public $m_agentConfig;//站点应用配置

	public $m_url;//请求url
	public $m_queryList;//请求的参数数组
	public $m_postData;//请求提交的数据
	public $m_postMsg;//请求提交的解密xml对象

	private $wxcpt;//加密解密类

	/**
	 * 构造函数
	 * @param $url string 请求url
	 * @param $postData string 请求提交的数据
	 */
	public function __construct($url, $postData)
	{
		$this->m_queryList = self::parseQueryString($url);
		$this->m_wid = $this->m_queryList['wid'];
		$this->m_rid = $this->m_queryList['rid'];
		$this->m_aid = $this->m_queryList['aid'];

		$wxqy_config = new WXQY_Config($this->m_wid, $this->m_rid);
		$this->m_config = $wxqy_config->getConfig();
		$this->m_agentConfig = $wxqy_config->getAgentConfig($this->m_aid);
		$this->wxcpt = new WXBizMsgCrypt($this->m_agentConfig['token'], $this->m_agentConfig['key'], $this->m_agentConfig['corpid']);

		//解密消息内容
		if(!empty($postData)){
			$this->m_postMsg = $this->decryptMsg($postData);
		}
	}

	/**
	 * 验证URL
	 */
	public function verifyURL(){
		$params = $this->m_queryList;

		$replyEchostr = '';// 需要返回的明文
		$errCode = $this->wxcpt->VerifyURL($params['msg_signature'], $params['timestamp'], $params['nonce'], $params['echostr'], $replyEchostr);

		if ($errCode != 0) {
			self::errlog(__METHOD__, func_get_args(), '验证URL错误:'.$errCode);
			Response::write('');
		}
		else{
			Response::write($replyEchostr);
		}
	}

	/**
	 * 解密消息体
	 * @param $xmlstring string 加密xml字符串
	 * @return  obj 解密后的xml对象
	 */
	private function decryptMsg($xmlstring){
		if(empty($xmlstring)){
			return null;
		}

		$params = $this->m_queryList;
		$deMsg = '';// 解密后的字符串
		$errCode = $this->wxcpt->DecryptMsg($params['msg_signature'], $params['timestamp'], $params['nonce'], $xmlstring, $deMsg);

		if ($errCode != 0) {
			self::errlog(__METHOD__, func_get_args(), '解密消息错误:'.$errCode);
			return null;
		}

		$xml = simplexml_load_string($deMsg, 'SimpleXMLElement', LIBXML_NOCDATA);

		return $xml;
	}

	/**
	 * 加密消息体
	 * @param $xmlstring string 消息的明文xml字符串
	 * @return  string 加密后的xml字符串
	 */
	private function encryptMsg($xmlstring)
	{
		if(empty($xmlstring)){
			return '';
		}

		$params = $this->m_queryList;
		$enMsg = '';//加密后字符串
		$errCode = $this->wxcpt->EncryptMsg($xmlstring, $params['timestamp'], $params['nonce'], $enMsg);

		if ($errCode != 0) {
			self::errlog(__METHOD__, func_get_args(), '加密消息错误:'.$errCode);
			return '';
		}

		return $enMsg;
	}

	/**
	 * 响应text消息
	 * @param $content string text消息内容
	 */
	public function responseText($content){
		// 需要发送的明文
		$xmlTemlate = '<xml>
		<ToUserName><![CDATA[%s]]></ToUserName>
		<FromUserName><![CDATA[%s]]></FromUserName>
		<CreateTime>%s</CreateTime>
		<MsgType><![CDATA[text]]></MsgType>
		<Content><![CDATA[%s]]></Content>
		</xml>';

		$toUserName = $this->m_postMsg->FromUserName;
		$fromUserName = $this->m_postMsg->ToUserName;
		$createTime = time();
		$xml = sprintf($xmlTemlate, $toUserName, $fromUserName, $createTime, $content);
		$resMsg = $this->encryptMsg($xml);

		Response::write($resMsg);
	}

	/**
	 * 响应news消息
	 * @param $articles array news消息内容
	 * <ul>
	 * 	 <li>title</li>
	 * 	 <li>description</li>
	 * 	 <li>picUrl</li>
	 * 	 <li>url</li>
	 * </ul>
	 */
	public function responseNews($articles){
		// 需要发送的明文
		$itemTemplate = '<item>
			<Title><![CDATA[%s]]></Title>
			<Description><![CDATA[%s]]></Description>
			<PicUrl><![CDATA[%s]]></PicUrl>
			<Url><![CDATA[%s]]></Url>
		</item>';
		$itemXml = '';
		foreach ($articles as $item){
			$itemXml = $itemXml.sprintf($itemTemplate, $item['title'], $item['description'], $item['picUrl'], $item['url']);
		}

		$xmlTemlate = '<xml>
		<ToUserName><![CDATA[%s]]></ToUserName>
		<FromUserName><![CDATA[%s]]></FromUserName>
		<CreateTime>%s</CreateTime>
		<MsgType><![CDATA[news]]></MsgType>
		<ArticleCount>%s</ArticleCount>
		<Articles>
			%s
		</Articles>
		</xml>';

		$toUserName = $this->m_postMsg->FromUserName;
		$fromUserName = $this->m_postMsg->ToUserName;
		$createTime = time();
		$articleCount = count($articles);
		$xml = sprintf($xmlTemlate, $toUserName, $fromUserName, $createTime, $articleCount, $itemXml);
		$resMsg = $this->encryptMsg($xml);

		Response::write($resMsg);
	}
}
?>