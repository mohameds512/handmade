import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class addressView extends StatelessWidget {
  const addressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Address"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: ListView(
          children: [

          ],
        ),
      ),
    );
  }
}
