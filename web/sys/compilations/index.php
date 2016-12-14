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
	<link rel="stylesheet" href="/css/index.min.css">
	<!--云 start-->
	<div id="sky">
		<div class="clound s1"></div>
		<div class="clound s2"></div>
		<div class="clound s3"></div>
		<div class="clound s4"></div>
		<div class="clound s5"></div>
		<div class="clound s6"></div>
	</div>
	<!--云 end-->

	<!--left start-->
  <div id="left">
      打算
  </div>
	<!--left end-->

	<!--right start-->
	<div id="right">
    
	</div>
	<!--right end-->

	<!--中部分主体 start-->
	<div id="app">
    	<h1 v-text="message" class="title"></h1>
		<!--导航 start-->
		<div class="nav">
			<div class="name">

			</div>
		</div>
		<!--导航 end-->
	</div>
	<!--中部分主体 end-->

	<script src="/js/index.min.js" charset="utf-8"></script>
</body>
</html>