import 'package:flutter/material.dart';
import 'package:flutter_get_example/controllers/todo_controller.dart';
import 'package:flutter_get_example/models/todo.dart';
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  final textController = new TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    //
    final todoController = Get.find<TodoController>();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
                child: TextField(
              controller: textController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "What do you want to accomplish? ",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              style: TextStyle(fontSize: 25),
              keyboardType: TextInputType.multiline,
              maxLines: 999,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FlatButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('CANCEL',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  color: Colors.red,
                ),
                FlatButton(
                  onPressed: () {
                    todoController.todos.add(Todo(text: textController.text));
                    Get.back();
                  },
                  child: Text('ADD',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  color: Colors.green,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
