<?php
//定义数据库连接
$db = DB::get_db();

if (Request::is_ajax()) {
  $action = Request::get(1);
  if ($action == 'code') {
    $type = Request::post('type');
    $sql = "select * from code where type = ? order by updatetime asc";
    $parm = array($type);
    $res = $db->query($sql, $parm);
    //获取代码库内容
    Response::json(array(
      'errcode' => '0', 
      'errmsg' => '',
      'data' => $res  
    ));
  }
}