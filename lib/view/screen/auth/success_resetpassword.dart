import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/forgetpassword/successresetpassword_controller.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:handmade/view/widget/auth/custombuttonauth.dart';
import 'package:get/get.dart';
class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller = Get.put(SuccessResetPasswordControllerImp()) ;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        title: Text(
          "reset password".tr,
          style: const TextStyle(color: AppColor.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),

        child:  Column(

          children: [
            const Center(child:  Icon(Icons.check_circle_outline,size: 200,color: AppColor.primaryColor,)),
            Text(
              "password reset successfully".tr,
              style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColor.grey),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonAuth(
                text: "login",
                onPressed: (){
                  controller.goLogin();
                },
              ),
            ),
            const SizedBox(height: 120,),
          ],

        ),


      ),
    );
  }
}
