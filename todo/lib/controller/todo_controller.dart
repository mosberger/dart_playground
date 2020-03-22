import '../todo.dart';

class TodoController extends ResourceController {
  final todoList = <TodoModel>[
    TodoModel.create('Todo 1'),
    TodoModel.create('Todo 2'),
    TodoModel.create('Todo 3'),
  ];

  @Operation.get()
  Future<Response> getTodoList() async => Response.ok(todoList);
}
