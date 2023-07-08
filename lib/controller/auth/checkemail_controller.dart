import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/constant/routes.dart';

abstract class CheckEmailController extends GetxController {
  late TextEditingController email;
  checkEmail();
  goToSuccessSignUp();

}
class CheckEmailControllerImp extends CheckEmailController{

  @override
  checkEmail() {

  }
  @override
  goToSuccessSignUp() {
    Get.offNamed(AppRoute.success_signup);
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}