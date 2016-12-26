<?php
//定义数据库连接
$db = DB::get_db();

if (Request::is_ajax()) {
  $action = Request::get(1);
  if ($action == 'code') {
    //获取代码库内容
    $type = Request::post('type');
    $sql = "select * from code where type = ? order by updatetime asc";
    $parm = array($type);
    $res = $db->query($sql, $parm);
    Response::json(array(
      'errcode' => '0', 
      'errmsg' => '',
      'data' => $res  
    ));
  }else if($action == 'level'){
    $sql = "select * from level order by CAST(`li` AS DECIMAL) desc limit 1, 10";
    $res = $db->query($sql);
    $set = array();
    foreach($res as $i => $v){
        $set[$i]['id'] = $v['id'];
        $set[$i]['li'] = $v['li'];
        $set[$i]['state'] = $v['state'];
    }
    //获取等级
    Response::json(array(
      'errcode' => '0',
      'errmsg' => '',
      'data' => $set  
    ));
  }
}