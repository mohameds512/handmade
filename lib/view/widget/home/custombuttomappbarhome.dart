import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/homescreen_controller.dart';

import 'custombuttomappbar.dart';
class CustomButtomAppBarHome extends GetView<HomeScreenControllerImp> {
  const CustomButtomAppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        height: 60,
        child:Row(
          children: [
            ...List.generate(
                controller.listPage.length+1,
                    (index) {
                  int i = index > 2 ? index - 1 : index;
                  return index == 2 ? const Spacer() :
                  CustomButtomAppBar(
                    icontitle: controller.pagestitle[i]['title'],
                    icondata: controller.pagestitle[i]['icon'],
                    onPressedIcon: (){
                      controller.changePage(i);
                    },
                    active: controller.selectedPage == i ? true : false,
                  );
                }
            )

          ],
        )


    );
  }
}
