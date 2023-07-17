import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/auth/login_data.dart';

import '../../core/class/statusrequest.dart';

abstract class LoginController extends GetxController {
  late TextEditingController email;
  late TextEditingController password;
  StatusRequest? statusRequest = StatusRequest.none;
  String? status = 'success';
  bool isShowPassword = true;
  login();
  goSignUp();
  forgetPassword();
}
class LoginControllerImp extends LoginController{
  LoginData loginData = LoginData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  showPassword(){
    isShowPassword = !isShowPassword;
    // isShowPassword = isShowPassword==true ? false : true;
    update();
  }
  @override
  login() async{
    var formdata = formstate.currentState;
    if(formdata!.validate() ){
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text,password.text);
      statusRequest = handlingData(response);
      print("success");
      print(response);
      if(response["status"] == "success"){

        Get.offNamed(AppRoute.home);
        update();
      }else if(response["status"] =='verify_email'){
        Get.defaultDialog(title: "Warning",middleText:  "You must Verify Email First ");
        update();
      }else if(response["status"] =='invalid_mail_password'){
        Get.defaultDialog(title: "Warning",middleText:  "Invalid Phone Number Or Email ");
        update();
      }else{
        Get.defaultDialog(title: "Warning",middleText:  "Something wont wrong ");
        statusRequest = StatusRequest.failure;
      }
      update();
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