import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../view/screen/home.dart';
abstract class HomeScreenController extends GetxController {
  changePage(int selectedPage);
}
class HomeScreenControllerImp extends HomeScreenController {
  int selectedPage = 0;
  int? spacerItem;
  List pagestitle = [
    "Home",
    "Profile",
    "Favorites",
    "Settings",
  ];
  List<Widget> listPage = [
    const Home(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("setting"),)
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Profile"),)
      ],
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("favorites"),)
      ],
    ),
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