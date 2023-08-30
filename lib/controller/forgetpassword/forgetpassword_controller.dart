import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/data/datasource/remote/forgetpassword/checkemail.dart';

abstract class ForgetPasswordController extends GetxController {
  late TextEditingController email;
  checkEmail();
  goToVerifyCode();

}
class ForgetPasswordControllerImp extends ForgetPasswordController{
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  @override
  checkEmail() {
    Get.offNamed(AppRoute.verifycode_resetpassword);
  }
  @override
  goToVerifyCode() {

    var formdata = formstate.currentState;
    if(formdata!.validate() ){
      Get.offNamed(AppRoute.verifycode_resetpassword);
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