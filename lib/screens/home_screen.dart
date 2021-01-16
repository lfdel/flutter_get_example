import 'package:flutter/material.dart';
import 'package:flutter_get_example/controllers/todo_controller.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    final todoController = Get.put(TodoController());
    //
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo list"),
      ),
      body: Container(
        child: Obx(() => ListView.separated(
            itemBuilder: (context, index) => ListTile(),
            separatorBuilder: (_, __) => Divider(),
            itemCount: todoController.todos.length)),
      ),
    );
  }
}
