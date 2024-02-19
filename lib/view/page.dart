import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/model/todo.dart';
import 'package:todo/view/todoitem.dart';
import 'package:todo/view_model/todo_view_model.dart';
import 'package:todo/view_model/user_view_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer2<UserViewModel, TodoViewModel>(
      builder: (context, userVM, todoVM, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Align(
            alignment: Alignment.centerLeft,
            child: userVM.user == null
                ? ElevatedButton(
                    onPressed: () => userVM.signInWithGoogle(),
                    child: const Text('sign in'),
                  )
                : ElevatedButton(
                    onPressed: () => userVM.signOut(),
                    child: const Text('sign out'),
                  ),
          ),
        ),
        body: userVM.user == null
            ? const Center(
                child: Text('please sign in to continue'),
              )
            : todoVM.todoList == null
                ? const Center(
                    child: Text('loading'),
                  )
                : Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: todoVM.todoList!.length,
                              itemBuilder: (context, index) => TodoItem(
                                todo: todoVM.todoList!.todoList[index],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      bottom: 13,
                                      right: 80,
                                      left: 20,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 5,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).focusColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: TextField(
                                      decoration: const InputDecoration(
                                        hintText: 'add new things',
                                        border: InputBorder.none,
                                      ),
                                      controller: textController,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
        floatingActionButton: userVM.user != null && todoVM.todoList != null
            ? FloatingActionButton(
                onPressed: () {
                  todoVM.addTodos(
                    Todo(todoText: textController.text, done: false),
                  );
                  textController.clear();
                },
                tooltip: 'add todo',
                child: const Icon(Icons.add),
              )
            : null,
      ),
    );
  }
}
