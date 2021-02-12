import 'package:flutter/material.dart';

class CustomWidgets {
  Widget appBar(Text title, List<Widget> actions) {
    return AppBar(
      title: title,
      actions: actions,
      elevation: 0,
    );
  }
}
