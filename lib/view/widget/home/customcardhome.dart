import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/home_controller.dart';

import '../../../core/constant/color.dart';
import 'package:get/get.dart';
class CustomCardHome extends GetView<HomeControllerImp> {
  final String titletext;
  final String bodytext;
  const CustomCardHome({Key? key, required this.titletext, required this.bodytext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Stack(children: [
        Container(
          alignment: Alignment.center,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.red,
          ),
          child:  ListTile(
            title: Text(titletext,style: TextStyle(color: Colors.white,fontSize: 20)),
            subtitle: Text(bodytext,style: TextStyle(color: Colors.white,fontSize: 40)),
          ),
        ),
        Positioned(
          top: -30,
          right: controller.Lang != "ar" ? -30 : null,
          left: controller.Lang == "ar" ? -30 : null,
          child: Container(
            height: 170,
            width: 170,
            decoration: BoxDecoration(
                color: AppColor.shadowPrimaryColor,
                borderRadius: BorderRadius.circular(170)
            ),
          ),
        )
      ],
      ),
    );
  }
}
