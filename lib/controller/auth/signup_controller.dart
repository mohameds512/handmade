import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/auth/signup.dart';

abstract class SignUpController extends GetxController {
  late TextEditingController email;
  late TextEditingController username;
  late TextEditingController phone;
  late TextEditingController password;
  StatusRequest? statusRequest = StatusRequest.none;
  signup();
  goLogin();
  goToVerifyEmail();

  SignUpData signUpData = SignUpData(Get.find());
}
class SignUpControllerImp extends SignUpController{
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  signup() async{
    var formdata = formstate.currentState;
    if(formdata!.validate() ){
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(username.text,email.text,password.text,phone.text);
      statusRequest = handlingData(response);
      if(response["status"] == "success"){
        print("success");
        print(response);
        Get.offNamed(AppRoute.verifycode,arguments: {
          "email":email.text
        });
        update();
      }else{
        Get.defaultDialog(title: "Warning",middleText:  "Phone Number Or Email Already Exist");
      }
    }else{
      print("ffffffff");
    }
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