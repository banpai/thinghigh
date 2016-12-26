<?php
//定义数据库连接
$db = DB::get_db();

if (Request::is_ajax()) {
  $action = Request::get(1);
  if ($action == 'code') {
    //获取代码库内容
    $flag = Request::post('flag');
    $id = Request::post('id');
    if($flag === '2'){
      $sql = "select * from code where id = ?";
      $parm = array($id);
      $res = $db->query($sql, $parm);
    }
    Response::json(array(
      'errcode' => '0',
      'errmsg' => $id,
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
  }else if($action == 'codename'){
    $sql = "select * from codename";
    $res = $db->query($sql);
    $set = array(
      array(
        'value' => 'javascript',
        'label' => 'javascript',
        // 'children' => array()
      ),
      array(
        'value' => 'php',
        'label' => 'php',
        'children' => array()
      ),
      array(
        'value' => 'mysql',
        'label' => 'mysql',
        // 'children' => array()
      ),
      array(
        'value' => 'css',
        'label' => 'css',
        // 'children' => array()
      ),
      array(
        'value' => 'html',
        'label' => 'html',
        // 'children' => array()
      )
    );
    foreach($res as $i => $v){
        if($v['type'] === '1'){
          $arrayname = array(
            'value' => $v['codeid'],
            'code' => $v['codeid'],
            'label' => $v['title']
          );
          array_push($set[0]['children'], $arrayname);
        }else if($v['type'] === '2'){
           $arrayname = array(
            'value' => $v['codeid'],
            'code' => $v['codeid'],
            'label' => $v['title']
          );
          array_push($set[1]['children'], $arrayname);
        }else if($v['type'] === '3'){
           $arrayname = array(
            'value' => $v['codeid'],
            'code' => $v['codeid'],
            'label' => $v['title']
          );
          array_push($set[2]['children'], $arrayname);
        }else if($v['type'] === '4'){
           $arrayname = array(
            'value' => $v['codeid'],
            'code' => $v['codeid'],
            'label' => $v['title']
          );
          array_push($set[3]['children'], $arrayname);
        }else if($v['type'] === '5'){
           $arrayname = array(
            'value' => $v['codeid'],
            'code' => $v['codeid'],
            'label' => $v['title']
          );
          array_push($set[4]['children'], $arrayname);
        }
    }
    //获取等级
    Response::json(array(
      'errcode' => '0',
      'errmsg' => '',
      'data' => $set  
    ));
  }
}