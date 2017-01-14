<?php
//定义数据库连接
$db = DB::get_db();
$user_guid = 'AE01B41A-30FA-9267-E2C4-D307F3C7EB32';
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
    //获取等级
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
    //检索代码库的名称
    $sql = "select id as codeid,title,type from code";
    $res = $db->query($sql);
    $set = array(
      array(
        'value' => 'javascript',
        'label' => 'javascript',
        'children' => array()
      ),
      array(
        'value' => 'php',
        'label' => 'php',
        'children' => array()
      ),
      array(
        'value' => 'mysql',
        'label' => 'mysql',
        'children' => array()
      ),
      array(
        'value' => 'css',
        'label' => 'css',
        'children' => array()
      ),
      array(
        'value' => 'html',
        'label' => 'html',
        'children' => array()
      ),
      array(
        'value' => 'mixed',
        'label' => 'mixed',
        'children' => array()
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
        }else if($v['type'] === '6'){
           $arrayname = array(
            'value' => $v['codeid'],
            'code' => $v['codeid'],
            'label' => $v['title']
          );
          array_push($set[5]['children'], $arrayname);
        }
    }
    //获取等级
    Response::json(array(
      'errcode' => '0',
      'errmsg' => '',
      'data' => $set  
    ));
  }else if($action === 'putcode'){
    //增加代码
     $id = Request::post('id');
     $type = Request::post('type');
     $content= Request::post('content');
     $title= Request::post('title');
     $code = new Model('code');
     if($id){
       $code -> find(array('id' => $id));
     }else{
       $code -> createtime = DB::raw('now()');
     }
     $code -> type = $type;
     $code -> title = $title;
     $code -> content = $content;
     $code -> updatetime = DB::raw('now()');
     if($code -> save()){
       Response::json(array(
          'errcode' => '0',
          'errmsg' => ''
       ));
     }else{
       Response::json(array(
          'errcode' => '1',
          'errmsg' => '保存失败'
       )); 
     }
  }else if($action === 'delcode'){
    //删除代码
    $id = Request::post('id');
    $code = new Model('code');
    $code -> find(array('id' => $id));
    if($code -> remove()){
       Response::json(array(
          'errcode' => '0',
          'errmsg' => ''
       ));
     }else{
       Response::json(array(
          'errcode' => '1',
          'errmsg' => '删除失败'
       )); 
     }
  }else if($action === 'puttask'){
    //增加,修改任务
    $name = Request::post('name');
    $id = Request::post('id');
    $task = new Model('task');
    if($id){
      $task -> find(array('id' => $id));
    }else{
      $task -> createtime = DB::raw('now()');
    }
    $task -> user_guid = $user_guid;
    $task -> name = $name;
    $task -> state = '0';
    $task -> updatetime = DB::raw('now()');
    if($task -> save()){
       Response::json(array(
          'errcode' => '0',
          'errmsg' => ''
       ));
     }else{
       Response::json(array(
          'errcode' => '1',
          'errmsg' => '删除失败'
       )); 
     }
  }else if ($action === 'gettask') {
    //搜索任务数据
    $sql = "select id,name,state,createtime,updatetime from task order by createtime asc";
    $res = $db->query($sql);
    Response::json(array(
      'errcode' => '0',
      'errmsg' => '',
      'date' => $res
    ));
  }else if($action === 'oktask'){
    //修改任务状态
    $id = Request::post('id');
    $state = Request::post('state');
    $task = new Model('task');
    $task -> find(array('id' => $id));
    $task -> state = $state;
    $task -> updatetime = DB::raw('now()');
    if($task -> save()){
       Response::json(array(
          'errcode' => '0',
          'errmsg' => ''
       ));
     }else{
       Response::json(array(
          'errcode' => '1',
          'errmsg' => '保存失败'
       )); 
     }
  }else if($action === 'deltask'){
    //删除任务
    $id = Request::post('id');
    $task = new Model('task');
    $task -> find(array('id' => $id));
    if($task -> remove()){
       Response::json(array(
          'errcode' => '0',
          'errmsg' => ''
       ));
     }else{
       Response::json(array(
          'errcode' => '1',
          'errmsg' => '删除失败'
       )); 
     }
  }
}