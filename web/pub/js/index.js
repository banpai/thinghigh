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
    codecontent: '#没有代码',
    tasksearch: '',
    visible: false,
    jilian: false,
    select3: '1',
    //模块的显示隐藏
    model: 'task',
    codesearch: '',
    taskli: [{
      date: '2016-12-14',
      lidata: []
    }],
    codename: [{
      "value": "javascript",
      "label": "javascript"
    },{
    "value": "php",
    "label": "php",
    "children": [{
      "value": "1",
      "code": "1",
      "label": "存单表数据"
    }]
  }]
  },
  filters: {
    marked: marked
  },
  methods: {
    update: function (e) {
      this.input = e.target.value;
    },
    change: function (status) {
      // console.log(status);
      this.jilian = status;
      this.codesearch = '';
      // this.$Message.info('开关状态：' + status);
    },
    show: function () {
      this.visible = true;
    },
    format: function (labels, selectedData) {
      const index = labels.length - 1;
      const data = selectedData[index] || false;
      if (data && data.code) {
        console.log('x');
        if (this.codesearch !== data.code) {
          portsfun.getcode(data.value, '2');
        }
        this.codesearch = data.code;
        return labels[index];
      }
      // return labels[index];
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
  //获取代码库名称数据
  var getcodename = function () {
    ajax('index-codename.html', {

    }, function (data) {
      app.codename = data.data;
      var xx = JSON.stringify(data);
      console.log(xx);
    });
  };
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
  var getcode = function (id, flag) {
    ajax('index-code.html', {
      id: id,
      flag: flag
    }, function (data) {
      app.codecontent = data.data[0].content;
      var xx = JSON.stringify(data.data[0].content);
      console.log(xx);
    });
  };
  return {
    getbuttonsdata: getbuttonsdata,
    getleveldata: getleveldata,
    getcode: getcode,
    getcodename: getcodename
  };
}());

//全局初始化
$(function () {
  portsfun.getbuttonsdata();
  portsfun.getleveldata();
  portsfun.getcodename();
});