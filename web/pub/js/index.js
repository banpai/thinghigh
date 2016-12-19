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
  }
});

//渲染中部
var app = new Vue({
  el: '#app',
  data: {
    tasksearch: '',
    taskli: [{
      date: '2016-12-14',
      lidata: []
    }]
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

//thinghigh初始化模块
var thinghigh = (function () {
  //初始化本地myDB数据库
  var myDB = {
    name: 'thinghigh',
    version: 1,
    db: null,
    callback: function () {
      getbuttonsdata();
      getleveldata(); 
    }
  };
  //获取按钮模块数据
  var getbuttonsdata = function () {
     ajax('/js/data/buttons.json', {}, function (data) {
      right.buttons = data.data;
      bpdb.addData('buttons', data.data);
    });
  };
  //获取等级数据
  var getleveldata = function () {
    ajax('/js/data/level.json', {}, function (data) {
      left.level = data.data;
      console.log();
    });
  };
  //初始化
  var start = function () {
    bpdb.start(myDB);
  };
  return {
    start: start,
    myDB: myDB
  };
}());

//全局初始化
$(function () {
  thinghigh.start();
});