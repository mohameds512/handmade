import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/forgetpassword/checkemail.dart';

abstract class CheckEmailController extends GetxController {
  late TextEditingController email;
  StatusRequest? statusRequest = StatusRequest.none;
  checkEmail();
  checkCode();


}
class CheckEmailControllerImp extends CheckEmailController{
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  @override
  checkEmail() async{
    var formdata = formstate.currentState;
    if(formdata!.validate() ){
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      statusRequest = handlingData(response);
      print("success");
      print(response);
      if(response["status"] == "success"){
        Get.offNamed(AppRoute.verifycode_resetpassword,arguments: {
          "email":email.text
        });
        update();
      }else{
        Get.defaultDialog(title: "Warning",middleText:  "Email Not Found");
        statusRequest = StatusRequest.failure;
      }
      update();
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

  @override
  checkCode() {
    // TODO: implement checkCode
    throw UnimplementedError();
  }
}