<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=0"/>
	<meta name="apple-mobile-web-app-scapable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<meta name="formate-detection" content="telephone=no" />
	<title><?php echo $PAGE_TITLE != '' ? $PAGE_TITLE : '自我管理'; ?></title><script type="text/javascript">var wyf_jspath = "/@system/";</script><script type="text/javascript" src="/@system/js/jquery.js"></script><script type="text/javascript" src="/@system/js/wyfadapter.js"></script>
	<!--<script type="text/javascript" src="/@system/js/vue.js"></script>-->
  <script src="//v1.vuejs.org/js/vue.min.js"></script>
</head>
<body>
<meta name="viewport" content="width=640,user-scalable=no" />
  <link rel="stylesheet" href="/css/wysiwyg.css">
	<link rel="stylesheet" href="/css/index.css">
  <script src="/js/marked.min.js" charset="utf-8"></script>
  <!-- 引入样式 -->
  <link rel="stylesheet" href="//unpkg.com/iview/dist/styles/iview.css">
  <!-- 引入组件库 -->
  <script src="//unpkg.com/iview/dist/iview.min.js"></script>
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
  <div id="left" class="bian">
    <div class="li" v-for="item in level">
      <p class="word" v-text="item.li"></p>
    </div>
    <div id="process"></div>
  </div>
	<!--left end-->

	<!--right start-->
	<div id="right" class="bian">
    <div class="li" v-for="item in buttons" v-on:click="cgmk(item.state)">
      <p class="word" v-text="item.name"></p>
    </div>
	</div>
	<!--right end-->

	<!--中部分主体 start-->
	<div id="app">

		<!--任务 start-->
    <div id="task" v-if="model === 'task'">
      <!--搜索 start-->
      <div class="task_header">
        <input v-model="tasksearch" placeholder="增加任务，按回车键添加" class="addtask">
      </div>
      <!--搜索 end-->
      <div class="task_box" v-for="item in taskli">
        <!--未完成 start-->
        <div class="task_ready">
          <div class="task_ready_li" v-for="index in item.lidata">
            <div class="task_ready_li_complete">OK</div>
            <div class="task_ready_li_year">2016-12-17</div>
            <!--<input class="task_ready_li_name" v-model="index.name">-->
            <div class="task_ready_li_name" v-text="index.name"></div>
          </div>
        </div>
        <!--未完成 end-->
        <!--已结束 start-->
        <div class="task_end">
          <div class="task_end_li" v-for="index in item.lidata" v-text="index.name"></div>
        </div>
        <!--已结束 end-->
      </div>
    </div>
		<!--任务 end-->

    <!--代码库 start-->
    <div id="code" v-if="model === 'code'">
       <!--搜索 start-->
      <div class="task_header">
        <!--按钮开关 start-->
        <Switch @on-change="change" class="switch"></Switch>
        <!--按钮开关 end-->
        <!--级联选择 start-->
        <div class="bordjilian" v-if="jilian">
          <Cascader :data="data" trigger="hover" class="jilian"></Cascader>
        </div>
        <!--级联选择 end-->
        <input  v-if="!jilian" v-model="codesearch" placeholder="代码名称，按回车键搜索" class="addtask">
      </div>
      <!--搜索 end-->
      <div style="height: 200px;"></div>
      <i-button @click="show">Click me!</i-button>
      <Modal :visible.sync="visible" title="Welcome">欢迎使用 iView</Modal>
      <div v-html="compiledMarkdown" class="wysiwyg"></div>
    </div>
    <!--代码库 end-->
	</div>
	<!--中部分主体 end-->

	<script src="/js/index.min.js" charset="utf-8"></script>
</body>
</html>