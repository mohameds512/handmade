import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/auth/successsignup_controller.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:handmade/view/widget/auth/custombuttonauth.dart';
import 'package:get/get.dart';

class SuccessSignUP extends StatelessWidget {
  const SuccessSignUP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller = Get.put(SuccessSignUpControllerImp()) ;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        title: Text(
          "sign up".tr,
          style: const TextStyle(color: AppColor.black),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),

        child:  Column(

          children: [
            const Center(child:  Icon(Icons.check_circle_outline,size: 200,color: AppColor.primaryColor,)),
            Text(
                "signup successfully".tr,
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
