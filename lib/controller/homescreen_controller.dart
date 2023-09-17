import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/view/screen/notification/notification.dart';
import 'package:handmade/view/screen/offers.dart';
import 'package:handmade/view/screen/settings.dart';

import '../view/screen/home.dart';
abstract class HomeScreenController extends GetxController {
  changePage(int selectedPage);
}
class HomeScreenControllerImp extends HomeScreenController {
  int selectedPage = 0;
  int? spacerItem;
  List pagestitle = [
    {
      "title": "Home",
      "icon": Icons.home
    },
    {
      "title": "Offers",
      "icon": Icons.local_offer_outlined
    },
    {
      "title": "Notifications",
      "icon": Icons.notifications_active_outlined
    },
    {
      "title": "Settings",
      "icon": Icons.settings
    },
  ];
  List<Widget> listPage = [
    const Home(),
    Offers(),
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Center(child: Text("setting"),)
    //   ],
    // ),
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     Center(child: Text("Profile"),)
    //   ],
    // ),
    NotificationView(),
    Settings()

  ];
  @override
  changePage(int i) {
    selectedPage = i;
    if(i == 1){
      spacerItem = 1;
    }
    update();
  }

}