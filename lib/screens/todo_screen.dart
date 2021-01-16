import 'package:flutter/material.dart';

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
                child: TextField(
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
                  onPressed: () {},
                  child: Text('CANCEL',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  color: Colors.red,
                ),
                FlatButton(
                  onPressed: () {},
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
