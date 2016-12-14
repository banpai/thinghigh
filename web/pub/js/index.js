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
    message: '测试标题!'
  }
});