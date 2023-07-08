import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/onboarding_controller.dart';

import '../../../core/constant/color.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp > {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.only(top: 20),
    height: 45,
    child: MaterialButton(
    padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 0),
    onPressed: (){
      controller.next();
    },
    color: AppColor.primaryColor,
    child:  Text("Continue".tr),
    textColor: Colors.white,
    ),
    );
  }
}
