import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/onboarding_controller.dart';

import '../../../core/constant/color.dart';
import '../../../data/datasource/static.dart';
import 'package:get/get.dart';
class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  PageView.builder(
      controller: controller.pageController,
      onPageChanged: (val){
        controller.onPageChanged(val);
      },
        itemCount: OnBoardingList.length,
        itemBuilder: (context , i) => Column(
          children: [
            Text(OnBoardingList[i].title!,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 22,color: AppColor.black
                ),
            ) ,
            const SizedBox(height: 80),
            Image.asset(OnBoardingList[i].image!,width: 180,height: 250,fit: BoxFit.fill,) ,
            Container(
              // padding: const EdgeInsets.all(10),
              width: double.infinity,
              alignment: Alignment.center,
              child: Text(OnBoardingList[i].body!,textAlign: TextAlign.center,
                style: const TextStyle(height: 2, color: AppColor.grey, fontWeight: FontWeight.bold, fontSize: 18),
              ) ,
            ),
          ],
        )
    );
  }
}
