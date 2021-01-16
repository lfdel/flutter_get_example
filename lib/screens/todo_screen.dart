import 'package:flutter/material.dart';
import 'package:flutter_get_example/controllers/todo_controller.dart';
import 'package:flutter_get_example/models/todo.dart';
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  final int index;

  TodoScreen({Key key, this.index}) : super(key: key);

  final textController = new TextEditingController(text: "");

  bool add() {
    return index == null;
  }

  String textButton() {
    if (add()) {
      return "ADD";
    }
    return "EDIT";
  }

  @override
  Widget build(BuildContext context) {
    //
    final todoController = Get.find<TodoController>();

    if (!add()) {
      textController.text = todoController.todos[index].text;
    }

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
                    if (add()) {
                      todoController.todos.add(Todo(text: textController.text));
                    } else {
                      var todo = todoController.todos[index];
                      todo.text = textController.text;
                      todoController.todos[index] = todo;
                    }
                    Get.back();
                  },
                  child: Text(textButton(),
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
