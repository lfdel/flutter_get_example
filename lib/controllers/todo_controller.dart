import 'package:flutter_get_example/models/todo.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  var todos = <Todo>[].obs;
}
