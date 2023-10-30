import 'package:flutter/cupertino.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/constant/ImageAssets.dart';

import 'package:lottie/lottie.dart';
class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
   final Widget loadingWidget;
  const HandlingDataView({Key? key, required this.statusRequest, required this.widget,  required this.loadingWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      statusRequest == StatusRequest.loading ?
        loadingWidget
         // Center(child: Lottie.asset(AppImageAssets.loading1,),)
          :
      statusRequest == StatusRequest.offlinefailure ?
      Center(child: Lottie.asset(AppImageAssets.offline,repeat: false),):
      statusRequest == StatusRequest.serverfailure ?
      Center(child: Lottie.asset(AppImageAssets.serverError,repeat: false),):
      statusRequest == StatusRequest.failure ?
      Center(child: Lottie.asset(AppImageAssets.failure,repeat: false),):
      widget;
  }
}
