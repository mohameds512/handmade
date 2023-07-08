import 'package:flutter/cupertino.dart';
import 'package:handmade/controller/onboarding_controller.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static.dart';
import 'package:get/get.dart';
class CustomDotController extends StatelessWidget {
  const CustomDotController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(builder: (controller)=>Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        ...List.generate(
            OnBoardingList.length,
                (index) => AnimatedContainer(
              margin: const EdgeInsets.only(right: 6),
              duration: const Duration(microseconds: 900),
              width: controller.currentPage == index ? 20 :6,
              height: 6,
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            )
        )
      ],));

  }
}
