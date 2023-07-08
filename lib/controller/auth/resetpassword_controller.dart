import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/constant/routes.dart';

abstract class ResetPasswordController extends GetxController {
  late TextEditingController password;
  late TextEditingController confirm_password;
  resetPassword();
  goToSuccessResetPassword();

}
class ResetPasswordControllerImp extends ResetPasswordController{

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  resetPassword() {

  }
  @override
  goToSuccessResetPassword() {
    var formdata = formstate.currentState;
    if(formdata!.validate() ){
      Get.offNamed(AppRoute.successresetpassword);
    }else{
      print("ffffffff");
    }

  }

  @override
  void onInit() {
    password = TextEditingController();
    confirm_password = TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    confirm_password.dispose();
    super.dispose();
  }
}