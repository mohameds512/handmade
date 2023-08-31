import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/cart/cart_data.dart';
import 'package:handmade/services/services.dart';

class CartController extends GetxController{
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
  int? countItem ;
  List cartItems = [];
  String totalPrice = '0' ;
  String totalCount = '0' ;
  MyServices myServices = Get.find();

  addToCart(item_id) async {

    statusRequest = StatusRequest.loading;
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

  addToCartFromCart(item_id) async {
    if(cartItems.isNotEmpty){
      int index = cartItems.indexWhere((cartItem) => cartItem['id'] == item_id);
      if (index != -1) {
        int varTotal = int.parse(totalCount!);
        varTotal++;
        totalCount = varTotal.toString();
        cartItems[index]['item_count'] ++;
        cartItems[index]['all_price'] = cartItems[index]['all_price'] + cartItems[index]['price'] ;
        double Dtotal_price = double.parse(totalPrice!);
        double varX = Dtotal_price + cartItems[index]['price'];
        totalPrice = varX.toString();
      } else {

      }
      update();
    }

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
    statusRequest = StatusRequest.loading;
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

  removeFromCartFromCart(item_id) async {
    if (cartItems.isNotEmpty) {
      int index = cartItems.indexWhere((cartItem) => cartItem['id'] == item_id);
      print(index);
      if (index != -1) {
        cartItems[index]['item_count']--;
        int varTotal = int.parse(totalCount!);
        varTotal--;
        totalCount = varTotal.toString();
        cartItems[index]['all_price'] = cartItems[index]['all_price'] - cartItems[index]['price'] ;

        double Dtotal_price = double.parse(totalPrice!);
        double varX = Dtotal_price - cartItems[index]['price'];
        totalPrice = varX.toString();
        if (cartItems[index]['item_count'] == 0) {
          cartItems.removeWhere((element) => element["id"] == item_id);
        }
      } else {
        // Handle the case when the item is not found in cartItems
      }
      update();
    }

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
  countItemCart(item_id) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.countItemCart(item_id, myServices.sharedPreference.getInt("id"));

    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      countItem = response['carts'];
      return countItem;

    }else{
      statusRequest = StatusRequest.failure;
    }
  }
  @override
  viewCart() async {
    cartItems.clear();
    statusRequest = StatusRequest.loading;
    var response = await cartData.indexCart(myServices.sharedPreference.getInt("id"));
    statusRequest = handlingData(response);
    cartItems = response['carts'];
    totalPrice =   response['totalPrice'].toString();
    totalCount =   response['total_count'].toString();
    update();

  }

  @override
  void onInit() {
    viewCart();
    super.onInit();
  }
}
