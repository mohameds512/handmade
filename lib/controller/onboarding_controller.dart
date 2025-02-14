import 'package:flutter/cupertino.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/services/services.dart';
import '../../../data/datasource/static.dart';
import 'package:get/get.dart';
abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged( int index);
}

class OnBoardingControllerImp extends OnBoardingController{
  late PageController pageController;
  int currentPage = 0;
  MyServices myServices = Get.find();
  @override
  next() {
    currentPage++;
    if(currentPage > OnBoardingList.length - 1){
      myServices.sharedPreference.setString("step", "1");
        Get.offAllNamed(AppRoute.login);
    }else{
      pageController.animateToPage(currentPage, duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }

  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }
  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}