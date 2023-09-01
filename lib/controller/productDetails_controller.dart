import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/cart/cart_controller.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/cart/cart_data.dart';
import 'package:handmade/services/services.dart';

abstract class ProductDetailsController extends GetxController{

}

class   ProductDetailsControllerImp extends ProductDetailsController{
  // CartController cartController = Get.put(CartController());
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());

  late StatusRequest statusRequest;
  Map? Item;
  int coutItemCart = 0;
  intialData() async {
    statusRequest = StatusRequest.loading;
    Item = Get.arguments["selectedItem"];
    coutItemCart = await countItemCart(Item!["id"]);
    statusRequest = StatusRequest.success;
    update();
  }
  List itemColors = [
    "Red","Black","Green"
  ];

  countItemCart(item_id) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.countItemCart(item_id, myServices.sharedPreference.getInt("id"));

    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      return response['carts'];


    }else{
      statusRequest = StatusRequest.failure;
    }
  }
  @override
  addCountItemCart(item_id){
    coutItemCart++;
    update();
    addToCart(item_id);
  }

  addToCart(item_id) async {

    var response = await cartData.addToCart(item_id, myServices.sharedPreference.getInt("id"));

    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      Get.rawSnackbar(
          title: "Notificstion",
          messageText: Text("Added to cart")
      );
    }else{
      statusRequest = StatusRequest.failure;
    }
  }

  removeFromCart(item_id) async {
    var response = await cartData.removeFromCart(item_id, myServices.sharedPreference.getInt("id"));

    statusRequest = handlingData(response);

    if(StatusRequest.success == statusRequest){
      Get.rawSnackbar(
          title: "Notificstion",
          messageText: Text("Added to cart")
      );
    }else{
      statusRequest = StatusRequest.failure;
    }
  }

  @override
  removeCountItemCart(item_id){
    if(coutItemCart >0){
      removeFromCart(item_id);
      coutItemCart--;
    }
    update();
  }
  @override
  void onInit() {
     intialData();
    super.onInit();
  }
}