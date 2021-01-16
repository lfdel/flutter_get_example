import 'package:flutter/material.dart';
import 'package:flutter_get_example/controllers/todo_controller.dart';
import 'package:flutter_get_example/screens/todo_screen.dart';
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
            itemBuilder: (context, index) => Dismissible(
                  key: UniqueKey(),
                  background: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Icon(Icons.delete),
                    ),
                  ),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (onDismissed) {
                    var todo = todoController.todos[index];
                    todoController.todos.removeAt(index);
                    Get.snackbar("Removed", todo.text,
                        snackPosition: SnackPosition.BOTTOM,
                        mainButton: FlatButton(
                          onPressed: () {
                            todoController.todos.insert(index, todo);
                            if (Get.isSnackbarOpen) {
                              Get.back();
                            }
                          },
                          child: Text("Undo"),
                        ));
                  },
                  child: ListTile(
                    title: Text(
                      todoController.todos[index].text,
                      style: (todoController.todos[index].done
                          ? TextStyle(
                              decoration: TextDecoration.lineThrough,
                            )
                          : TextStyle(decoration: TextDecoration.none)),
                    ),
                    leading: Checkbox(
                      value: todoController.todos[index].done,
                      onChanged: (value) {
                        var todo = todoController.todos[index];
                        todo.done = value;
                        todoController.todos[index] = todo;
                      },
                    ),
                    trailing: Icon(Icons.chevron_right),
                    onTap: () {
                      Get.to(TodoScreen(
                        index: index,
                      ));
                    },
                  ),
                ),
            separatorBuilder: (_, __) => Divider(),
            itemCount: todoController.todos.length)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(TodoScreen());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
