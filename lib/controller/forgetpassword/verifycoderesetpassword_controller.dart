import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/data/datasource/remote/auth/verivycodesignup.dart';
import 'package:handmade/data/datasource/remote/forgetpassword/verifycode.dart';

import '../../core/functions/handlingdatacontroller.dart';

abstract class VerifyCodeResetPassword extends GetxController {


  checkCode();
  goResetPassword(String verificationCode);


}
class VerifyCodeResetPasswordImp extends VerifyCodeResetPassword{

  String? email;
  VerifyCodeForgetPasswordData verifyCodeForgetPasswordData = VerifyCodeForgetPasswordData(Get.find());
  StatusRequest? statusRequest;
  @override
  checkCode() {
    // TODO: implement checkCode
    throw UnimplementedError();
  }
  @override
  goResetPassword(String verificationCode) async{

    statusRequest = StatusRequest.loading;
    update();
    print(email);
    print(verificationCode);
    var response = await  verifyCodeForgetPasswordData.postData(email!, verificationCode);
    print("response");
    print(response);
    statusRequest = handlingData(response);
    if(response["status"] == true ){
      print('eeeeeeeeeeeeeeeeeee');
      Get.offNamed(AppRoute.resetpassword,arguments: {
        "email":email
      });
    }else{
      Get.defaultDialog(title: "Warning",middleText:  "Invalid Code");
      statusRequest = StatusRequest.failure;

    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

}