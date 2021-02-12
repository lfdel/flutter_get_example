import 'package:flutter/material.dart';
import 'package:flutter_get_example/controllers/todo_controller.dart';
import 'package:flutter_get_example/models/todo.dart';
import 'package:flutter_get_example/views/custom_widgets.dart';
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
        appBar: CustomWidgets().appBar(Text(''), [
          FlatButton(
            onPressed: () => controller.onPressed(_add(), index),
            child: Text(_textButton(), style: TextStyle(color: Colors.white)),
          )
        ]),
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
}
