//indexedDB的本地数据库操作
var bpdb = (function () {
  var myDB = {};
  //初始化数据
  var start = function(data){
    myDB = data;
    openDB(myDB);
  };
  var db, db2;
  //打开数据库
  var openDB = function (myDB) {
    var version = myDB.version || 1;
    var request = window.indexedDB.open(myDB.name, version);
    request.onerror = function (e) {
      console.log(e.currentTarget.error.message);
    };
    request.onsuccess = function (e) {
      myDB.db = e.target.result;
      db = e.target.result;
      // db.deleteObjectStore('students');
      // var transaction = db.transaction('students', 'readwrite');
      // var store = transaction.objectStore('students');
      // store.delete(value);
      myDB.callback();
    };
    request.onupgradeneeded = function (e) {
      db2 = e.target.result;
      if (!db2.objectStoreNames.contains('buttons')) {
        db2.createObjectStore('buttons', {
          autoIncrement: true
        });
      }
      console.log('DB version changed to ' + version);
    };
  };
  //关闭数据库
  var closeDB = function () {
    db.close();
  };
  //删除数据库
  var deleteDB = function (name) {
    window.indexedDB.deleteDatabase(name);
  };
  //增加数据
  var addData = function (storeName, array) {
    console.log(db);
    if (!db.objectStoreNames.contains(storeName)) {
      // db.createObjectStore(storeName, {
      //   autoIncrement: true
      // });
    }
    console.log(storeName);
    var transaction = db.transaction(storeName, 'readwrite');
    var store = transaction.objectStore(storeName);
    for (var i = 0, len = array.length; i < len; i++) {
      store.add(array[i]);
    }
  };
  //查找数据
  var getDataByKey = function (storeName, value) {
    var transaction = db.transaction(storeName, 'readwrite');
    var store = transaction.objectStore(storeName);
    var request = store.get(value);
    request.onsuccess = function (e) {
      var student = e.target.result;
      console.log(student);
    };
  };
  //更新数据
  var updateDataByKey = function (storeName, value) {
    var transaction = db.transaction(storeName, 'readwrite');
    var store = transaction.objectStore(storeName);
    var request = store.get(value);
    request.onsuccess = function (e) {
      var student = e.target.result;
      student.age = 35;
      store.put(student);
    };
  };
  //删除数据库
  var deleteDataByKey = function (storeName, value) {
    var transaction = db.transaction(storeName, 'readwrite');
    var store = transaction.objectStore(storeName);
    store.delete(value);
  };
  //清空object store
  var clearObjectStore = function (storeName) {
    var transaction = db.transaction(storeName, 'readwrite');
    var store = transaction.objectStore(storeName);
    store.clear();
  };
  //删除一个object store
  var deletestroe = function () {
    if (db.objectStoreNames.contains('students')) {
      db.deleteObjectStore('students');
    }
  };
  return {
    openDB: openDB,
    closeDB: closeDB,
    deleteDB: deleteDB,
    addData: addData,
    getDataByKey: getDataByKey,
    updateDataByKey: updateDataByKey,
    deleteDataByKey: deleteDataByKey,
    clearObjectStore: clearObjectStore,
    deletestroe: deletestroe,
    db: db,
    start: start
  }
}());