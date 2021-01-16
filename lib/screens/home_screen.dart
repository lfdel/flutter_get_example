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
            itemBuilder: (context, index) => ListTile(
                  title: Text(
                    todoController.todos[index].text,
                    style: (todoController.todos[index].done
                        ? TextStyle(
                            color: Colors.red,
                            decoration: TextDecoration.lineThrough,
                          )
                        : TextStyle(
                            color:
                                Theme.of(context).textTheme.bodyText1.color)),
                  ),
                  leading: Checkbox(
                    value: todoController.todos[index].done,
                    onChanged: (value) {
                      todoController.todos[index].done = value;
                    },
                  ),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    Get.to(TodoScreen(
                      index: index,
                    ));
                  },
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
