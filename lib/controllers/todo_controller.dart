import 'package:flutter_get_example/models/todo.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();

    List storage = GetStorage().read("todos");
    if (storage != null) {
      todos = storage.map((json) => Todo.fromJson(json)).toList().obs;
    }

    ever(todos, (_) {
      GetStorage().write("todos", todos.toList());
    });
  }
}
