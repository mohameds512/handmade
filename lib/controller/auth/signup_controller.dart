import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/constant/routes.dart';

abstract class SignUpController extends GetxController {
  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController password;
  signup();
  goLogin();
  goToVerifyEmail();
}
class SignUpControllerImp extends SignUpController{
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  signup() {

  }
  @override
  goLogin() {
    Get.offAllNamed(AppRoute.signup);
  }
  goToVerifyEmail() {
    var formdata = formstate.currentState;
    if(formdata!.validate() ){
      Get.offNamed(AppRoute.verivyemail);
    }else{
      print("ffffffff");
    }

  }

  @override
  void onInit() {
    email = TextEditingController();
    username = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    username.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}