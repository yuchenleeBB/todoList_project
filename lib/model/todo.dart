class Todo {
  String todoText;
  bool done;
  Todo({
    required this.todoText,
    this.done = false,
  });
}

class TodoList {
  List<Todo> todoList;
  String id;

  TodoList({required this.todoList, required this.id});

  int get length => todoList.length;

  factory TodoList.fromJson(Map<String, dynamic> json) {
    final todos = json['todo_list'] as List;
    return TodoList(
        id: json['id'],
        todoList: todos
            .map((todo) => Todo(
                  todoText: todo['todoText'],
                  done: todo['done'],
                ))
            .toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'todo_list': todoList
          .map((todo) => {
                'todoText': todo.todoText,
                'done': todo.done,
              })
          .toList()
    };
  }
}
