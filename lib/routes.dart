
import 'package:flutter/cupertino.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/core/middleware/mymiddleware.dart';
import 'package:handmade/test.dart';
import 'package:handmade/view/address/add.dart';
import 'package:handmade/view/address/continue_add.dart';
import 'package:handmade/view/address/view.dart';
import 'package:handmade/view/screen/auth/checkemail.dart';
import 'package:handmade/view/screen/auth/forgetpasswoed.dart';
import 'package:handmade/view/screen/auth/login.dart';
import 'package:handmade/view/screen/auth/resetpassword.dart';
import 'package:handmade/view/screen/auth/signup.dart';
import 'package:handmade/view/screen/auth/success_resetpassword.dart';
import 'package:handmade/view/screen/auth/success_signup.dart';
import 'package:handmade/view/screen/auth/verifycode.dart';
import 'package:handmade/view/screen/auth/verifycode_resetPassword.dart';
import 'package:handmade/view/screen/cart/cart.dart';
import 'package:handmade/view/screen/checkout.dart';
import 'package:handmade/view/screen/favoritesitems.dart';
import 'package:handmade/view/screen/home.dart';
import 'package:handmade/view/screen/homescreen.dart';
import 'package:handmade/view/screen/items/items.dart';
import 'package:handmade/view/screen/language.dart';
import 'package:handmade/view/screen/notification/notification.dart';
import 'package:handmade/view/screen/onboarding.dart';
import 'package:get/get.dart';
import 'package:handmade/view/screen/order/archiveorder.dart';
import 'package:handmade/view/screen/order/order_details.dart';
import 'package:handmade/view/screen/order/pendingorder.dart';
import 'package:handmade/view/screen/products/productdetails.dart';
import 'package:handmade/view/test_view.dart';

List<GetPage<dynamic>> ? routes = [
  GetPage(name: "/" , page: ()=> const Language(),
      middlewares: [
        MyMiddleware(),
      ]
  ),
  GetPage(name:"/",page: () => const ProductDetails(),),
  GetPage(name: AppRoute.login , page: ()=> const Login()),
  GetPage(name: AppRoute.signup , page: ()=> const SignUp()),
  GetPage(name: AppRoute.forgetpassword , page: ()=> const ForgetPassword()),
  GetPage(name: AppRoute.verifycode , page: ()=> const VerifyCode()),
  GetPage(name: AppRoute.resetpassword , page: ()=> const ResetPassword()),
  GetPage(name: AppRoute.success_signup , page: ()=> const SuccessSignUP()),
  GetPage(name: AppRoute.successresetpassword , page: ()=> const SuccessResetPassword()),
  GetPage(name: AppRoute.onBoarding , page: ()=> const OnBoarding()),
  // GetPage(name: AppRoute.home , page: ()=> const Home()),

  GetPage(name: AppRoute.verivyemail , page: ()=> const VerifyEmail()),
  GetPage(name: AppRoute.verifycode_resetpassword , page: ()=> const VerifyCodeForResetPassword()),
  GetPage(name: AppRoute.home , page: ()=> const HomeScreen()),
  GetPage(name: AppRoute.items , page: ()=> const Items()),
  GetPage(name: AppRoute.productdetails,page: () => const ProductDetails(),),
  GetPage(name: AppRoute.favoritesItems,page: () => const FavoriteItems(),),

  GetPage(name:AppRoute.cart,page: () => const Cart(),),


  GetPage(name:AppRoute.AddressView,page: () => const addressView(),),
  GetPage(name:AppRoute.AddressAdd,page: () => const addressAdd(),),
  GetPage(name:AppRoute.addressAddContinue,page: () => const addressAddContinue(),),

  GetPage(name:AppRoute.checkout,page: () => const CheckOut(),),

  GetPage(name:AppRoute.pendingOrder,page: () => const PendingOrder(),),
  GetPage(name:AppRoute.archivedOrder,page: () => const ArchivedOrder(),),
  GetPage(name:AppRoute.detailsOrder,page: () => const OrderDetails(),),

  GetPage(name:AppRoute.notification,page: () => const NotificationView(),),

];