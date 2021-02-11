import 'package:flutter/material.dart';
import 'package:flutter_get_example/controllers/todo_controller.dart';
import 'package:flutter_get_example/str.dart';
import 'package:flutter_get_example/views/todo_view.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TodoController());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Str.titleApp),
          actions: [
            FlatButton(
              onPressed: () => Get.to(TodoView()),
              child: Text('New', style: TextStyle(color: Colors.white)),
            )
          ],
        ),
        body: _Body(controller: controller),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final TodoController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(() => ListView.separated(
          itemBuilder: (context, index) => Dismissible(
                key: UniqueKey(),
                background: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(Icons.delete),
                  ),
                ),
                direction: DismissDirection.startToEnd,
                onDismissed: (onDismissed) {
                  _remove(controller, index);
                },
                child: _ListTile(
                  controller: controller,
                  index: index,
                ),
              ),
          separatorBuilder: (_, __) => Divider(),
          itemCount: controller.todos.length)),
    );
  }
}

class _ListTile extends StatelessWidget {
  //
  final TodoController controller;
  final int index;

  const _ListTile({Key key, this.controller, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var todo = controller.todos[index];
    return ListTile(
      title: Text(
        todo.text,
        style: (todo.done
            ? TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              )
            : TextStyle(decoration: TextDecoration.none)),
      ),
      subtitle: Text(todo.dateFormatOne()),
      leading: Checkbox(
        value: todo.done,
        onChanged: (value) => controller.checkOnChanged(index, value),
      ),
      trailing: Icon(Icons.chevron_right),
      onTap: () {
        Get.to(TodoView(
          index: index,
        ));
      },
    );
  }
}

void _remove(TodoController controller, int index) {
  var todo = controller.todos[index];
  controller.todos.removeAt(index);
  Get.snackbar("Removed", todo.text,
      snackPosition: SnackPosition.BOTTOM,
      mainButton: FlatButton(
        onPressed: () {
          controller.todos.insert(index, todo);
          if (Get.isSnackbarOpen) {
            Get.back();
          }
        },
        child: Text("Undo"),
      ));
}
