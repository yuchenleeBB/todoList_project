import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/model/todo.dart';

class TodoRepo {
  static final _db = FirebaseFirestore.instance.collection('todo_list');

  static Future<TodoList?> read(String id) async {
    try {
      final doc = await _db.doc(id).get();
      final data = doc.data();
      if (data == null) {
        return null;
      } else {
        return TodoList.fromJson(data);
      }
    } on Exception {
      return null;
    }
  }

  static Future<TodoList?> create(String id) async {
    if ((await _db.doc(id).get()).exists) return null;
    final data = TodoList(id: id, todoList: []);
    try {
      await _db.doc(id).set(data.toJson());
      return data;
    } on Exception {
      return null;
    }
  }

  static Future<void> update(TodoList todoList) async {
    await _db.doc(todoList.id).set(todoList.toJson());
  }
}
