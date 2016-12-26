//left 渲染
var left = new Vue({
  el: '#left',
  data: {
    //等级数组
    level: []
  }
});
//right 渲染
var right = new Vue({
  el: '#right',
  data: {
    //button按钮
    buttons: []
  },
  methods: {
    cgmk: function (s) {
      app.model = s;
    }
  }
});
//渲染中部
var app = new Vue({
  el: '#app',
  data: {
    input: '# hello',
    tasksearch: '',
    //模块的显示隐藏
    model: 'task',
    taskli: [{
      date: '2016-12-14',
      lidata: []
    }]
  },
  computed: {
    compiledMarkdown: function () {
      return marked(this.input, { sanitize: true })
    }
  },
  methods: {
    update: function(e){
      this.input = e.target.value;
    }
  }
});

document.onkeydown = function (event) {
  var e = event || window.event || arguments.callee.caller.arguments[0];
  if (e && e.keyCode == 13) { // enter 键
    console.log(app.tasksearch);
    var sel = {
      name: app.tasksearch
    };
    app.taskli[0].lidata.push(sel);
    app.tasksearch = '';
  }
};

//统一管理接口
var portsfun = (function(){
    //获取按钮模块数据
    var getbuttonsdata = function () {
      ajax('/js/data/buttons.json', {}, function (data) {
        right.buttons = data.data;
      });
    };
    //获取等级数据
    var getleveldata = function () {
      ajax('/js/data/level.json', {}, function (data) {
        left.level = data.data;
      });
    };
    //获取代码库的代码
    var getcode = function(){
      
      ajax('index-code.html', {
        type: '2'
      }, function(data){
        var xx = JSON.stringify(data);
        console.log(xx);
      });
    };
    return {
      getbuttonsdata: getbuttonsdata,
      getleveldata: getleveldata,
      getcode: getcode
    };
}());

//thinghigh初始化模块
var thinghigh = (function () {
  //初始化
  var start = function () {
    portsfun.getbuttonsdata();
    portsfun.getleveldata();
    portsfun.getcode();
  };
  return {
    start: start
  };
}());

//全局初始化
$(function () {
  thinghigh.start();
});