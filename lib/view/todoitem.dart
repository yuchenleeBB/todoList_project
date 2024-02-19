import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/view_model/todo_view_model.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  const TodoItem({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoViewModel>(
      builder: (context, todoVM, child) => Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
        ),
        child: ListTile(
          tileColor: Theme.of(context).cardColor,
          onTap: () {
            todoVM.changeTodoState(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          leading: Icon(
            todo.done ? Icons.check_box : Icons.check_box_outline_blank,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(
            todo.todoText,
            style: TextStyle(
              color: Theme.of(context).primaryColorDark,
              fontSize: 15,
              fontWeight: FontWeight.w300,
              decoration: todo.done ? TextDecoration.lineThrough : null,
            ),
          ),
          trailing: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              iconSize: 18,
              icon: const Icon(Icons.delete),
              onPressed: () {
                todoVM.deleteTodos(todo);
              },
            ),
          ),
        ),
      ),
    );
  }
}
