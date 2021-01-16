import 'package:flutter/material.dart';
import 'package:flutter_get_example/screens/home_screen.dart';
import 'package:flutter_get_example/screens/todo_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    //home: TodoScreen(),
    home: HomeScreen(),
  ));
}
