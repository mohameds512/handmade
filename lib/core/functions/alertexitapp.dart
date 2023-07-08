import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
Future<bool> alertExitApp(){
  Get.defaultDialog(
    title: "alert".tr,
    middleText: "are you sure exit".tr,
    actions: [
      ElevatedButton(
          onPressed: (){
            exit(0);
          },
          child: Text("confirm".tr)
      ),
      ElevatedButton(
          onPressed: (){
            Get.back();
          },
          child: Text("cancel".tr)
      )
    ]
  );
  return Future.value(true);
}