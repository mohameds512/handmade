import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/forgetpassword/resetpassword_controller.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/functions/validinput.dart';
import 'package:handmade/view/widget/auth/logoauth.dart';
import 'package:get/get.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtixttitleauth.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        title:  Text("reset password",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColor.grey),),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30 ),
        child: Form(
          key: controller.formstate ,
          child: ListView(
            children: [
              const LogoAuth(),
              const CustomTextTitleAuth(text:"new password"),
              const SizedBox( height: 10,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const CustomTextBodyAuth(bodytext: "please enter your password"),
              ),
              const SizedBox(height: 20,),
              CustomTextFormAuth(
                isNumber: false,
                valid: (val){
                  return validInput(val!, 6, 20, "password");
                },
                hinttext: "Your Password",
                labeltext: "Password",
                iconData: Icons.lock_outline,
                myController: controller.password,
              ),
              CustomTextFormAuth(
                isNumber: false,
                valid: (val){
                  return validInput(val!, 6, 20, "confirm_password");
                },
                hinttext: "Confirm Password",
                labeltext: "Confirm Password",
                iconData: Icons.lock_outline,
                myController: controller.confirm_password,
              ),

              CustomButtonAuth(
                text: "save",
                onPressed: (){
                  controller.goToSuccessResetPassword();
                },
              ),
              const SizedBox(height: 10,),

            ],
          ),
        ),
      ),
    );
  }
}
