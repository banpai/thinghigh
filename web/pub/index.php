<?php
//定义框架文件夹
define('WYF_LOCAL_PATH',__FILE__);
define('WYF_FRAME_PATH',dirname(dirname(WYF_LOCAL_PATH)).'/');
define('WYF_LIB', dirname(WYF_FRAME_PATH).'/wyframework/');
//引入框架文件
require WYF_LIB.'wyf.php';
?>
