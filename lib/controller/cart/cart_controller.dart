import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/cart/cart_data.dart';
import 'package:handmade/services/services.dart';

class CartController extends GetxController{
  TextEditingController? controllerCoupon;
  Map? couponData;
  late int couponDiscount = 0;
  late String couponName = '';
  CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
  late StatusRequest couponStatusRequest;
  int? countItem ;
  List cartItems = [];
  String totalPrice = '0' ;
  String Price = '0' ;
  String totalCount = '0' ;
  MyServices myServices = Get.find();


  checkCoupon()async{
    couponStatusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(controllerCoupon!.text);
    couponStatusRequest = handlingData(response);
    if(StatusRequest.success == couponStatusRequest){

        if(response['status'] == 'success'){

          couponData = response['coupon'];
          couponDiscount = couponData!["discount"];
          couponName = couponData!["name"];

          update();
          Get.snackbar("Coupon", "Coupon Used Successfully",backgroundColor: AppColor.thirdColor);
        }else{
          Get.snackbar("Coupon", "Unfortunately Invalid Coupon !",backgroundColor: AppColor.thirdColor);
        }
    }
  }
  getTotalPrice(){
    double Dtotal_price = double.parse(totalPrice!);
    double DPrice = double.parse(Price);
    Dtotal_price = DPrice - (Dtotal_price *couponDiscount/100 );
    totalPrice = Dtotal_price.toStringAsFixed(2);
    return totalPrice;
  }
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
        cartItems[index]['all_price'] = cartItems[index]['all_price'] + (cartItems[index]['price'] - (cartItems[index]['price']* cartItems[index]['discount']/100 ));
        double Dtotal_price = double.parse(Price!);
        double varX = Dtotal_price + cartItems[index]['price'];
        Price = varX.toString();

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
        cartItems[index]['all_price'] = cartItems[index]['all_price'] - (cartItems[index]['price'] - (cartItems[index]['price']* cartItems[index]['discount']/100 ));

        double Dtotal_price = double.parse(Price!);
        double varX = Dtotal_price - cartItems[index]['price'];
        Price = varX.toString();

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
    Price =   response['totalPrice'].toString();

    totalCount =   response['total_count'].toString();
    update();

  }

  @override
  void onInit() {
    viewCart();
    controllerCoupon = TextEditingController() ;
    super.onInit();
  }
}
