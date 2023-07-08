import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/functions/alertexitapp.dart';
import 'package:handmade/core/functions/validinput.dart';
import 'package:get/get.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtixttitleauth.dart';
import '../../widget/auth/textsignup.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        title:  Text("Sign In",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColor.grey),),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30 ),
        child: Form(
          key: controller.formstate ,
          child: ListView(
            children: [
              // const LogoAuth(),
              const CustomTextTitleAuth(text:"Sign In"),
              const SizedBox( height: 10,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const CustomTextBodyAuth(bodytext: "new signIn stracture phrase"),
              ),
              const SizedBox(height: 20,),
              CustomTextFormAuth(
                isNumber: false,
                valid: (val){
                  return validInput(val!, 5,100, "username");
                },
                hinttext: "Enter UserName",
                labeltext: "UserName",
                iconData: Icons.person_2_outlined,
                myController: controller.username ,
              ),
              CustomTextFormAuth(
                isNumber: false,
                valid: (val){
                  return validInput(val!, 5,100, "email");
                },
                hinttext: "Enter Your Email",
                labeltext: "Email",
                iconData: Icons.email_outlined,
                myController: controller.email,
              ),
              CustomTextFormAuth(
                isNumber: true,
                valid: (val){
                  return validInput(val!, 11,11, "phone");
                },
                hinttext: "Enter Your Phone",
                labeltext: "Phone",
                iconData: Icons.phone_android_sharp,
                myController: controller.phone ,
              ),
              CustomTextFormAuth(
                isNumber: false,
                valid: (val){
                  return validInput(val!, 5,100, "password");
                },
                hinttext: "Your Password",
                labeltext: "Password",
                iconData: Icons.lock_outline,
                myController: controller.password,
              ),
              // Text("forget password".tr,textAlign: TextAlign.end,),
              CustomButtonAuth(
                text: "sign in",
                onPressed: (){
                  controller.goToVerifyEmail();
                },
              ),
              const SizedBox(height: 10,),
              CustomTextSignUp(
                ftext: "Already have an account?",
                ltext: "LogIn",
                onTap: (){
                  controller.goLogin();
                },
              ),
            ],
          ),
        ),
      ),) ,
    );
  }
}
