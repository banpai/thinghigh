//left 渲染
var left = new Vue({
  el: '#left',
  data: {
    percent: 0,
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
      app.code_id = null;
      app.codecontent = '#没有代码';
      app.codesearch = '';
      app.code_flag = true;
    }
  }
});

//渲染中部
var app = new Vue({
  el: '#app',
  data: {
    //搜索的代码显示
    codecontent: '#没有代码',
    //搜索的代码类型
    code_type: '',
    //搜索的代码id
    code_id: '',
    code_title: '',
    code_flag: true,
    //任务模块的添加
    tasksearch: '',
    visible: false,
    jilian: false,
    //编写的代码选择
    write_val: '1',
    write_name: '',
    //编写代码的部分
    write: '',
    //模块的显示隐藏
    model: 'task',
    //代码库名称的搜索
    codesearch: '',
    //任务模块
    taskli: [{
      date: '2016-12-14',
      lidata: []
    }],
    //代码库名称列表
    codename: []
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
      // this.codesearch = '';
      // this.$Message.info('开关状态：' + status);
    },
    show: function () {
      this.visible = true;
    },
    getcn: function(value){
      alert(value);
    },
    //获取代码的代码
    format: function (labels, selectedData) {
      var index = labels.length - 1;
      var data = selectedData[index] || false;
      if (data && data.code) {
        if (this.codesearch !== data.code) {
          if(this.code_flag){
            portsfun.getcode(data.value, '2');
            this.codesearch = data.label;
          }
        }
        return labels[index];
      }
      // return labels[index];
    },
    //代码库修改代码
    code_chang: function () {
      //赋值给写代码模块
      this.write = this.codecontent;
      //赋值type
      this.write_val = this.code_type;
      this.write_name = this.code_title;
      //转换模块
      this.model = 'write';
    },
    //代码库增加代码
    code_add: function(){
      this.model = 'write';
      this.code_id = null;
      this.codecontent = '#没有代码';
      this.codesearch = '';
      this.code_flag = true;
    },
    //代码库删除代码
    code_delete: function () {
      if(this.code_id){
        var that = this;  
        portsfun.delcode({
            id: that.code_id,
            callback: function(){
               //清空
                that.code_id = null;
                that.codesearch = '';
                that.code_flag = false;
                that.codecontent = '#没有代码';
                that.model = 'write';
                that.model = 'code';
                //刷新代码名称
                portsfun.getcodename();
                //提示成功
                that.$Message.success('删除成功');
            }
        });
      }else{
        this.$Message.error('请选择代码片段');
      }
    },
    //编写代码库的提交
    write_sub: function () {
      if (!this.write_name) {
        this.$Message.error('请填写名称');
      } else if (!this.write) {
        this.$Message.error('请填写内容');
      } else {
        var that = this;
        this.$Modal.confirm({
          title: '确定要提交到代码库吗？',
          loading: true,
          content: '提交的代码片段可以在代码库模块中查询……',
          onOk: function () {
            portsfun.putcode({
              code_id: that.code_id,
              write: that.write,
              write_val: that.write_val,
              write_name: that.write_name,
              callback: function () {
                that.$Modal.remove();
                //清空
                that.write = '';
                that.write_val = '1';
                that.write_name = '';
                //刷新代码名称
                portsfun.getcodename();
                //提示成功
                that.$Message.success('提交成功');
                that.model = 'code';
                that.code_id = null;
                that.codecontent = '#没有代码';
                that.codesearch = '';
                that.code_flag = true;
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
  var putcode = function (m) {
    ajax('index-putcode.html', {
      id: m.code_id,
      type: m.write_val,
      content: m.write,
      title: m.write_name
    }, function (data) {
      var xx = JSON.stringify(data);
      console.log(xx);
      if (data.errcode === '0') {
        m.callback();
      } else {
        this.$Message.error(data.errmsg);
      }
    });
  };
  //删除代码库的表的代码
  var delcode = function(m){
    ajax('index-delcode.html', {
      id: m.id
    }, function (data) {
      var xx = JSON.stringify(data);
      console.log(xx);
      m.callback();
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
      app.code_type = data.data[0].type;
      app.code_id = data.data[0].id;
      app.code_title = data.data[0].title;
      var xx = JSON.stringify(data.data[0]);
      console.log(xx);
      $('pre code').each(function(i, block) {
        hljs.highlightBlock(block);
      });
    });
  };
  return {
    getbuttonsdata: getbuttonsdata,
    getleveldata: getleveldata,
    getcode: getcode,
    getcodename: getcodename,
    putcode: putcode,
    delcode: delcode
  };
}());

//全局初始化
$(function () {
  portsfun.getbuttonsdata();
  portsfun.getleveldata();
  portsfun.getcodename();
  hljs.initHighlightingOnLoad();
});
