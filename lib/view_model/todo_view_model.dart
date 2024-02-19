import 'package:flutter/material.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/repo/todo_repo.dart';
import 'package:todo/view_model/user_view_model.dart';

class TodoViewModel with ChangeNotifier {
  String? _uid;
  TodoList? _todoList;

  TodoViewModel(UserViewModel vm) {
    _uid = vm.user?.uid;
    if (_uid != null) {
      TodoRepo.read(_uid!).then((value) {
        _todoList = value;
        notifyListeners();
      });
    }
  }

  TodoList? get todoList => _todoList;

  Future<void> addTodos(Todo todo) async {
    if (_todoList == null) return;
    _todoList!.todoList.add(todo);
    TodoRepo.update(_todoList!);
    notifyListeners();
  }

  Future<void> deleteTodos(final Todo todo) async {
    if (_todoList == null) return;
    _todoList!.todoList.removeWhere((target) => target == todo);
    TodoRepo.update(_todoList!);
    notifyListeners();
  }

  Future<void> changeTodoState(final todo) async {
    todo.done = !todo.done;
    TodoRepo.update(_todoList!);
    notifyListeners();
  }
}
