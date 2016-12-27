//left 渲染
var left = new Vue({
  el: '#left',
  data: {
    percent: 0,
    //等级数组
    level: []
  },
  methods: {
    add: function () {
      if (this.percent >= 100) {
        return false;
      }
      this.percent += 10;
    },
    minus: function () {
      if (this.percent <= 0) {
        return false;
      }
      this.percent -= 10;
    }
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
    write_val: '1',
    write_name: '',
    //编写代码的部分
    write: '',
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
    }, {
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
    },
    //编写代码库的提交
    write_sub: function(){
      if(!this.write_name){
        this.$Message.error('请填写名称');
      }else if(!this.write){
        this.$Message.error('请填写内容');
      }else{
        var that = this;
        this.$Modal.confirm({
            title: '确定要提交到代码库吗？',
            loading: true,
            content: '提交的代码片段可以在代码库模块中查询……',
            onOk: function(){
                portsfun.putcode({
                  write: that.write,
                  write_val: that.write_val,
                  write_name: that.write_name,
                  callback: function(){
                    that.$Modal.remove();
                    //清空
                    that.write = '';
                    that.write_val = '';
                    that.write_name = '';
                    //刷新代码名称
                    portsfun.getcodename();
                  }
                });
            }
        });
      }
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
  //提交代码到代码库
  var putcode = function(m){
    ajax('index-putcode.html', {
      type: m.write_val,
      content: m.write,
      title: m.write_name
    }, function (data) {
      var xx = JSON.stringify(data);
      console.log(xx);
      if(data.errcode === '0'){
        m.callback();
      }else{
        this.$Message.error(data.errmsg);
      }
    });
  };
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
    getcodename: getcodename,
    putcode: putcode
  };
}());

//全局初始化
$(function () {
  portsfun.getbuttonsdata();
  portsfun.getleveldata();
  portsfun.getcodename();
});