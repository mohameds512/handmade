import 'package:flutter/material.dart';
import 'package:handmade/controller/onboarding_controller.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/data/datasource/static.dart';

import '../widget/onboarding/custombutton.dart';
import '../widget/onboarding/customdotcontroller.dart';
import '../widget/onboarding/customslider.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body:SafeArea(
        child: Column(children: [
           Expanded(
            flex: 2,
            child:
            CustomSliderOnBoarding(),
          ) ,

           Expanded(
              flex: 1,
              child: Column(children: [
                 CustomDotController(),
                // Spacer(flex: 1,),
                SizedBox(height: 40,),
                 CustomButtonOnBoarding()
          ],))
        ],)

      )


    );
  }
}
