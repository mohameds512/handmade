import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController{

}

class ProductDetailsControllerImp extends ProductDetailsController{
  Map? Item;
  intialData() {
    Item = Get.arguments["selectedItem"];

  }
  List itemColors = [
    "Red","Black","Green"
  ];

  @override
  void onInit() {
     intialData();
    super.onInit();
  }
}