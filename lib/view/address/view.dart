import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/core/constant/routes.dart';
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
          Get.toNamed(AppRoute.AddressAdd);
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
