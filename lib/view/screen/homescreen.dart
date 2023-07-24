import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/homescreen_controller.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:get/get.dart';
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
                onPressed: (){},child: Icon(Icons.shopping_basket_outlined),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar:
              CustomButtomAppBarHome(),
              body: controller.listPage.elementAt(controller.selectedPage)
            )
    )
      ;
  }
}
