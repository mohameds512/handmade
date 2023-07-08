import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/core/functions/alertexitapp.dart';
import 'package:handmade/core/functions/validinput.dart';
import 'package:handmade/view/widget/auth/logoauth.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_controller.dart';
import '../../widget/auth/custombuttonauth.dart';
import '../../widget/auth/customtextbodyauth.dart';
import '../../widget/auth/customtextformauth.dart';
import '../../widget/auth/customtixttitleauth.dart';
import '../../widget/auth/textsignup.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        title:  Text("Login",style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColor.grey),),
      ),
      body: WillPopScope(
        onWillPop:
          alertExitApp
        ,
        child:  Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30 ),
          child: Form(
            key:controller.formstate ,
            child: ListView(
              children: [
                const LogoAuth(),
                const CustomTextTitleAuth(text:"welcome back"),
                const SizedBox( height: 10,),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  child: const CustomTextBodyAuth(bodytext: "sign in stracture phrase"),
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
                GetBuilder<LoginControllerImp>(builder: (controller)=>CustomTextFormAuth(
                  onTapIcon: (){
                    controller.showPassword();
                  } ,
                  obscureText: controller.isShowPassword,
                  isNumber: false,
                  valid: (val){
                    return validInput(val!, 6, 50, "password");
                  },
                  hinttext: "Your Password",
                  labeltext: "Password",
                  iconData: Icons.lock_outline,
                  myController: controller.password,
                ),),
                const SizedBox(height: 10,),
                InkWell(

                    onTap: (){
                      controller.forgetPassword();
                    },
                    child: Text("forget password".tr,textAlign: TextAlign.end,)
                ),
                CustomButtonAuth(
                  text: "sign in",
                  onPressed: (){
                    controller.login();
                  },
                ),
                const SizedBox(height: 10,),
                CustomTextSignUp(
                  ftext: "Don't have an account?",
                  ltext: "sign up",
                  onTap: (){
                    controller.goSignUp();
                  },
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
