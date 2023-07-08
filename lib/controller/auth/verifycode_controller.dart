import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/constant/routes.dart';

abstract class VerifyCodeController extends GetxController {

  checkCode();
  goResetPassword();


}
class VerifyCodeControllerImp extends VerifyCodeController{
  late String verifycode ;
  @override
  checkCode() {
    // TODO: implement checkCode
    throw UnimplementedError();
  }
  @override
  goResetPassword() {
    Get.offNamed(AppRoute.resetpassword);
  }

  @override
  void onInit() {
    super.onInit();
  }



}