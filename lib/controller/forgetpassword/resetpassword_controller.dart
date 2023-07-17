import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/forgetpassword/resetpasword.dart';

abstract class ResetPasswordController extends GetxController {
  late TextEditingController password;
  late TextEditingController confirm_password;
  resetPassword();
  goToSuccessResetPassword();

}
class ResetPasswordControllerImp extends ResetPasswordController{

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  ResetPasswordData resetPasswordData = ResetPasswordData(Get.find());
  StatusRequest? statusRequest;
  String? email;
  @override
  resetPassword() {

  }
  @override
  goToSuccessResetPassword() async {
    var formdata = formstate.currentState;
    if(formdata!.validate() ){
      statusRequest = StatusRequest.loading;
      update();
      var response = await resetPasswordData.postData(email!,password.text);
      statusRequest = handlingData(response);
      print("success");
      print(response);
      if(response["status"] == "success"){

        Get.offNamed(AppRoute.successresetpassword);
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
  void onInit() {
    password = TextEditingController();
    confirm_password = TextEditingController();
    email = Get.arguments["email"];
    super.onInit();
  }
  @override
  void dispose() {
    password.dispose();
    confirm_password.dispose();
    super.dispose();
  }
}