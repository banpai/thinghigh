<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=0"/>
	<meta name="apple-mobile-web-app-scapable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<meta name="formate-detection" content="telephone=no" />
	<title><?php echo $PAGE_TITLE != '' ? $PAGE_TITLE : '自我管理'; ?></title><script type="text/javascript">var wyf_jspath = "/@system/";</script><script type="text/javascript" src="/@system/js/jquery.js"></script><script type="text/javascript" src="/@system/js/wyfadapter.js"></script>
	<script type="text/javascript" src="/@system/js/vue.js"></script>
</head>
<body>

<body onload="init();">
  <canvas id="demoCanvas" width="500" height="300"></canvas>
</body>
<script>
  function init() {
    // 这里写代码
    var stage = new createjs.Stage("demoCanvas");
    var circle = new createjs.Shape();
    circle.graphics.beginFill("DeepSkyBlue").drawCircle(0, 0, 50);
    circle.x = 100;
    circle.y = 100;
    stage.addChild(circle);
    stage.update();
  }
</script>
<script src="https://code.createjs.com/easeljs-0.8.2.min.js" charset="utf-8"></script>
</body>
</html>