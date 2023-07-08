import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/core/functions/validinput.dart';
import 'package:handmade/view/widget/auth/logoauth.dart';
import 'package:get/get.dart';
import '../../../controller/auth/forgetpassword_controller.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../controller/auth/signup_controller.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtixttitleauth.dart';
import '../../widget/auth/textsignup.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller = Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        title:  Text("forget password",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColor.grey),),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30 ),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              const LogoAuth(),
              const CustomTextTitleAuth(text:"forget password"),
              const SizedBox( height: 10,),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: const CustomTextBodyAuth(bodytext: "check email"),
              ),
              const SizedBox(height: 20,),
              CustomTextFormAuth(
                isNumber: false,
                valid: (val){
                  return validInput(val!, 5, 100, "email");
                },
                hinttext: "Enter Your Email",
                labeltext: "Email",
                iconData: Icons.email_outlined,
                myController: controller.email,
              ),

              CustomButtonAuth(
                text: "send Verify code",
                onPressed: (){
                  controller.goToVerifyCode();
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
