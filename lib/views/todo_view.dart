import 'package:flutter/material.dart';
import 'package:flutter_get_example/controllers/todo_controller.dart';
import 'package:flutter_get_example/models/todo.dart';
import 'package:get/get.dart';

class TodoView extends StatelessWidget {
  final int index;

  TodoView({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TodoController>();

    if (!_add()) {
      controller.textController.value.text = controller.todos[index].text;
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            FlatButton(
              onPressed: () => _onPressed(controller),
              child: Text(_textButton(), style: TextStyle(color: Colors.white)),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(
                  child: TextField(
                controller: controller.textController.value,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: "New TODO",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 999,
              )),
            ],
          ),
        ),
      ),
    );
  }

  bool _add() {
    return index == null;
  }

  String _textButton() {
    if (_add()) {
      return "Add";
    }
    return "Edit";
  }

  void _onPressed(TodoController controller) {
    if (_add()) {
      controller.todos.add(Todo(
          text: controller.textController.value.text,
          date: DateTime.now().toString()));
    } else {
      var todo = controller.todos[index];
      todo.text = controller.textController.value.text.trim();
      todo.date = DateTime.now().toString();
      controller.todos[index] = todo;
    }
    controller.textController.value = TextEditingController(text: "");
    Get.back();
  }
}
