import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:get/get_utils/get_utils.dart';

import 'package:handmade/view/widget/auth/logoauth.dart';
import 'package:get/get.dart';
import '../../../controller/auth/verifycode_controller.dart';

import '../../widget/auth/customtextbodyauth.dart';

import '../../widget/auth/customtixttitleauth.dart';


class VerifyCode extends StatelessWidget {
  const VerifyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        title:  Text("verify code",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColor.grey),),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30 ),
        child: ListView(
          children: [
            const LogoAuth(),
            const CustomTextTitleAuth(text:"verify code"),
            const SizedBox( height: 10,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: const CustomTextBodyAuth(bodytext: "please enter the digit code sent to"),
            ),
            const SizedBox(height: 20,),
            OtpTextField(
              numberOfFields: 6,
              borderRadius: BorderRadius.circular(25),
              borderColor: const Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode){
                controller.goResetPassword();
              }, // end onSubmit
            ),

            // CustomButtonAuth(
            //   text: "send Verify code",
            //   onPressed: (){
            //
            //   },
            // ),
            const SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}
