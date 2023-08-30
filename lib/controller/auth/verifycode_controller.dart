import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/data/datasource/remote/auth/verivycodesignup.dart';

import '../../core/functions/handlingdatacontroller.dart';

abstract class VerifyCodeController extends GetxController {

  VerifyCodeSignUpData verifyCodeSignUpData = VerifyCodeSignUpData(Get.find());
  checkCode();
  goResetPassword();
  goSuccessSignUp(String verificationCode);

}
class VerifyCodeControllerImp extends VerifyCodeController{

  String? email;
  StatusRequest? statusRequest;
  @override
  checkCode() {
    // TODO: implement checkCode
    throw UnimplementedError();
  }
  @override
  goSuccessSignUp(String verificationCode) async{
    print(email);
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeSignUpData.postData(email!, verificationCode);

    statusRequest = handlingData(response);
    if(response["status"] == true ){

      Get.offNamed(AppRoute.success_signup);
    }else{
      Get.defaultDialog(title: "Warning",middleText:  "Invalid Code");
      statusRequest = StatusRequest.failure;

    }
    update();
  }
  @override
  goResetPassword() {

    Get.offNamed(AppRoute.resetpassword);
  }

  @override
  void onInit() {
    email = Get.arguments["email"];
    super.onInit();
  }

}