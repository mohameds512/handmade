import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController {
  late TextEditingController email;
  checkEmail();
  goToVerifyCode();

}
class ForgetPasswordControllerImp extends ForgetPasswordController{
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  checkEmail() {

  }
  @override
  goToVerifyCode() {
    var formdata = formstate.currentState;
    if(formdata!.validate() ){
      Get.offNamed(AppRoute.verifycode);
    }else{
      print("ffffffff");
    }

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