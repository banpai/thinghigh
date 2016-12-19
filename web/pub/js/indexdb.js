//indexedDB的本地数据库操作

//打开数据库
function openDB(myDB) {
  var version = myDB.version || 1;
  var request = window.indexedDB.open(myDB.name, version);
  request.onerror = function (e) {
    console.log(e.currentTarget.error.message);
  };
  request.onsuccess = function (e) {
    myDB.db = e.target.result;
    myDB.callback();
  };
  request.onupgradeneeded = function (e) {
    var db = e.target.result;
    if (!db.objectStoreNames.contains('buttons')) {
      db.createObjectStore('buttons', {
        autoIncrement: true
      });
    }
    console.log('DB version changed to ' + version);
  };
}

//关闭数据库
function closeDB(db) {
  db.close();
}

//删除数据库
function deleteDB(name) {
  indexedDB.deleteDatabase(name);
}

// openDB(myDB.name, myDB.version);
function addData(db, storeName, array) {
  // if (!db.objectStoreNames.contains(storeName)) {
  //   db.createObjectStore(storeName, {
  //     autoIncrement: true
  //   });
  // }
  console.log(array);
  var transaction = db.transaction(storeName, 'readwrite');
  var store = transaction.objectStore(storeName);
  for (var i = 0, len = array.length; i < len; i++) {
    store.add(array[i]);
  }
}

//查找数据
function getDataByKey(db, storeName, value) {
  var transaction = db.transaction(storeName, 'readwrite');
  var store = transaction.objectStore(storeName);
  var request = store.get(value);
  request.onsuccess = function (e) {
    var student = e.target.result;
    console.log(student);
  };
}

//更新数据
function updateDataByKey(db, storeName, value) {
  var transaction = db.transaction(storeName, 'readwrite');
  var store = transaction.objectStore(storeName);
  var request = store.get(value);
  request.onsuccess = function (e) {
    var student = e.target.result;
    student.age = 35;
    store.put(student);
  };
}

//删除数据库
function deleteDataByKey(db, storeName, value) {
  var transaction = db.transaction(storeName, 'readwrite');
  var store = transaction.objectStore(storeName);
  store.delete(value);
}

//清空object store
function clearObjectStore(db, storeName) {
  var transaction = db.transaction(storeName, 'readwrite');
  var store = transaction.objectStore(storeName);
  store.clear();
}

//删除一个object store
function deletestroe(){
  if (db.objectStoreNames.contains('students')) {
      db.deleteObjectStore('students');
    }
}
