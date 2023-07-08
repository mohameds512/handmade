
import 'package:flutter/cupertino.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/core/middleware/mymiddleware.dart';
import 'package:handmade/test.dart';
import 'package:handmade/view/screen/auth/checkemail.dart';
import 'package:handmade/view/screen/auth/forgetpasswoed.dart';
import 'package:handmade/view/screen/auth/login.dart';
import 'package:handmade/view/screen/auth/resetpassword.dart';
import 'package:handmade/view/screen/auth/signup.dart';
import 'package:handmade/view/screen/auth/success_resetpassword.dart';
import 'package:handmade/view/screen/auth/success_signup.dart';
import 'package:handmade/view/screen/auth/verifycode.dart';
import 'package:handmade/view/screen/language.dart';
import 'package:handmade/view/screen/onboarding.dart';
import 'package:get/get.dart';
import 'package:handmade/view/test_view.dart';

List<GetPage<dynamic>> ? routes = [
  // GetPage(name: "/" , page: ()=> const Language(),
  //     middlewares: [
  //       MyMiddleware(),
  //     ]
  // ),
  GetPage(name:"/",page: () => const TestView(),),
  GetPage(name: AppRoute.login , page: ()=> const Login()),
  GetPage(name: AppRoute.signup , page: ()=> const SignUp()),
  GetPage(name: AppRoute.forgetpassword , page: ()=> const ForgetPassword()),
  GetPage(name: AppRoute.verifycode , page: ()=> const VerifyCode()),
  GetPage(name: AppRoute.resetpassword , page: ()=> const ResetPassword()),
  GetPage(name: AppRoute.success_signup , page: ()=> const SuccessSignUP()),
  GetPage(name: AppRoute.successresetpassword , page: ()=> const SuccessResetPassword()),
  GetPage(name: AppRoute.verifycode , page: ()=> const VerifyCode()),
  GetPage(name: AppRoute.onBoarding , page: ()=> const OnBoarding()),
];