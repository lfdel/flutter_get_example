import 'package:flutter/material.dart';
import 'package:flutter_get_example/views/home_view.dart';
import 'package:flutter_get_example/str.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "${Str.titleApp} lfdel24@gmail.com",
    theme: ThemeData(
        primaryColor: Colors.purple, accentColor: Colors.purpleAccent),
    home: HomeView(),
  ));
}
