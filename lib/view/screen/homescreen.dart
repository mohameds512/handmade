import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/homescreen_controller.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/view/widget/home/custombuttomappbar.dart';
import 'package:handmade/view/widget/home/custombuttomappbarhome.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) =>
            Scaffold(
              // backgroundColor: Colors.lightBlue,
              floatingActionButton: FloatingActionButton(
                backgroundColor: AppColor.primaryColor,
                onPressed: (){
                  Get.toNamed(AppRoute.cart);
                },child: Icon(Icons.shopping_basket_outlined,color: Colors.white,),
                shape: CircleBorder(),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar:
              CustomButtomAppBarHome(),
              body: controller.listPage.elementAt(controller.selectedPage),
              // body:
              // WillPopScope(
              //   child: controller.listPage.elementAt(controller.selectedPage),
              //   onWillPop: (){
              //     Get.defaultDialog(
              //       title: "Warning",
              //       titleStyle: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold),
              //       middleText: "Are you sure ?",
              //       onConfirm: (){
              //         exit(0);
              //       },
              //       onCancel: (){
              //       },
              //       buttonColor: AppColor.thirdColor,
              //       confirmTextColor: AppColor.primaryColor,
              //       cancelTextColor: AppColor.primaryColor,
              //     );
              //     return Future.value(false);
              //   },
              // )
            )
    )
      ;
  }
}
