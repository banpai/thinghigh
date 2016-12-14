//left 渲染
var left = new Vue({
  el: '#left',
  data: {
    //等级数组
    level: [{
      li: '10'
    }, {
      li: '9'
    }, {
      li: '8'
    }, {
      li: '7'
    }, {
      li: '6'
    }, {
      li: '5'
    }, {
      li: '4'
    }, {
      li: '3'
    }, {
      li: '2'
    }, {
      li: '1'
    }]
  }
});

//right 渲染
var right = new Vue({
  el: '#right',
  data: {
    //button按钮
    buttons: [{
      name: '登录'
    }, {
      name: '任务'
    }, {
      name: '8'
    }, {
      name: '7'
    }, {
      name: '6'
    }, {
      name: '5'
    }, {
      name: '4'
    }, {
      name: '3'
    }, {
      name: '2'
    }, {
      name: '1'
    }]
  }
});



//渲染中部
var app = new Vue({
  el: '#app',
  data: {
    tasksearch: '',
    taskli:[
      {
        date: '2016-12-14',
        lidata: [
        ]
      }
    ]
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