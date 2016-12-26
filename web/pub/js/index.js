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
    visible: false,
    jilian: false,
    //模块的显示隐藏
    model: 'task',
    codesearch: '',
    taskli: [{
      date: '2016-12-14',
      lidata: []
    }],
    data: [{
      value: 'beijing',
      label: '北京',
      children: [{
        value: 'gugong',
        label: '故宫'
      }, {
        value: 'tiantan',
        label: '天坛'
      }, {
        value: 'wangfujing',
        label: '王府井'
      }]
    }, {
      value: 'jiangsu',
      label: '江苏',
      children: [{
        value: 'nanjing',
        label: '南京',
        children: [{
          value: 'fuzimiao',
          label: '夫子庙',
        }]
      }, {
        value: 'suzhou',
        label: '苏州',
        children: [{
          value: 'zhuozhengyuan',
          label: '拙政园',
        }, {
          value: 'shizilin',
          label: '狮子林',
        }]
      }],
    }]
  },
  computed: {
    compiledMarkdown: function () {
      return marked(this.input, {
        sanitize: true
      })
    }
  },
  methods: {
    update: function (e) {
      this.input = e.target.value;
    },
    change: function (status) {
      // console.log(status);
      this.jilian = status;
      // this.$Message.info('开关状态：' + status);
    },
    show: function () {
      this.visible = true;
    }
  }
});

document.onkeydown = function (event) {
  var e = event || window.event || arguments.callee.caller.arguments[0];
  if (e && e.keyCode == 13) { // enter 键
    if (app.model === 'task') {
      console.log(app.tasksearch);
      var sel = {
        name: app.tasksearch
      };
      app.taskli[0].lidata.push(sel);
      app.tasksearch = '';
    }
  }
};

//统一管理接口
var portsfun = (function () {
  //获取按钮模块数据
  var getbuttonsdata = function () {
    ajax('/js/data/buttons.json', {}, function (data) {
      right.buttons = data.data;
    });
  };
  //获取等级数据
  var getleveldata = function () {
    ajax('index-level.html', {}, function (data) {
      left.level = data.data;
      var xx = JSON.stringify(data);
      console.log(xx);
    });
  };
  //获取代码库的代码
  var getcode = function () {
    ajax('index-code.html', {
      type: '2'
    }, function (data) {
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