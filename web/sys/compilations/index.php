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
  <script src="/js/vue.min.js"></script>
</head>
<body>
<meta name="viewport" content="width=640,user-scalable=no" />
  <link rel="stylesheet" href="/css/wysiwyg.css">
	<link rel="stylesheet" href="/css/index.css">
  <script src="/js/marked.min.js" charset="utf-8"></script>
  <!-- 引入样式 -->
  <link rel="stylesheet" href="/css/iview.css">
	<!--云 start-->
	<!--<div id="sky">
		<div class="clound s1"></div>
		<div class="clound s2"></div>
		<div class="clound s3"></div>
		<div class="clound s4"></div>
		<div class="clound s5"></div>
		<div class="clound s6"></div>
	</div>-->
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
        <Switch @on-change="change" class="switch" size="large">
          <span slot="open">选择</span>
          <span slot="close">搜索</span>
        </Switch>
        <!--按钮开关 end-->
        <!--级联选择 start-->
        <div class="bordjilian" v-if="!jilian">
          <Cascader :data="codename" trigger="hover" class="jilian" :render-format="format" :on-change="getcn"></Cascader>
        </div>
        <!--级联选择 end-->
        <!--点击搜索 start-->
        <input  v-if="jilian" v-model="codesearch" placeholder="代码名称，按回车键搜索" class="addtask">
        <!--点击搜索 end-->
        <!--删除和编辑模块 start-->
         <Dropdown trigger="click" placement="bottom-start">
            <a href="javascript:void(0)">
                事件
                <Icon type="arrow-down-b"></Icon>
            </a>
            <Dropdown-menu slot="list">
                <Dropdown-item v-on:click="code_chang">修改</Dropdown-item>
                <Dropdown-item v-on:click="code_delete">删除</Dropdown-item>
                <Dropdown-item v-on:click="code_add">增加</Dropdown-item>
            </Dropdown-menu>
        </Dropdown>
        <!--删除和编辑模块 end-->
      </div>
      <!--搜索 end-->

      <!--显示代码 start-->
      <div v-html="codecontent | marked" class="wysiwyg codecontent"></div>
      <!--显示代码 end-->

    </div>
    <!--代码库 end-->

    <!--写代码 start-->
    <div id="write" v-if="model === 'write'">
      <!--头部输入名称 start-->
      <i-input placeholder="填写名称" class="writename" :value.sync="write_name">
          <i-select :model.sync="write_val" slot="prepend" style="width: 80px">
              <i-option value="1">javascript</i-option>
              <i-option value="2">php</i-option>
              <i-option value="3">mysql</i-option>
              <i-option value="4">css</i-option>
              <i-option value="5">html</i-option>
              <i-option value="6">mixed</i-option>
          </i-select>
          <i-button slot="append" icon="android-upload" v-on:click="write_sub">提交</i-button>
      </i-input>
      <!--头部输入名称 end-->
      <!--编写代码部分 start-->
      <div id="editor">
        <textarea v-model="write" debounce="300"></textarea>
        <div v-html="write | marked" class="wysiwyg show_write"></div>
      </div>
      <!--编写代码部分 end-->
    </div>
    <!--写代码 end-->
	</div>
	<!--中部分主体 end-->
  <!-- 引入组件库 -->
  <script src="/js/iview.min.js"></script>
	<script src="/js/index.js" charset="utf-8"></script>
</body>
</html>