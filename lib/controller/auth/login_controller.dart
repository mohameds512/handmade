import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/constant/routes.dart';

abstract class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  bool isShowPassword = true;
  login();
  goSignUp();
  forgetPassword();
}
class LoginControllerImp extends LoginController{

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  showPassword(){
    isShowPassword = !isShowPassword;
    // isShowPassword = isShowPassword==true ? false : true;
    update();
  }
  @override
  login() {
    var formdata = formstate.currentState;
    if(formdata!.validate() ){
        print("ddddddddd");
    }else{
      print("ffffffff");
    }
  }
  @override
  goSignUp() {
    Get.offAllNamed(AppRoute.signup);
  }

  forgetPassword() {
    Get.offAllNamed(AppRoute.forgetpassword);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}