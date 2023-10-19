import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/cart/cart_controller.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/cart/cart_data.dart';
import 'package:handmade/services/services.dart';
import 'dart:convert';
abstract class ProductDetailsController extends GetxController{

}

class   ProductDetailsControllerImp extends ProductDetailsController{
  // CartController cartController = Get.put(CartController());
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late StatusRequest statusRequest;
  Map? Item;
  List item_info = [];
  int coutItemCart = 0;
  List<TextEditingController> textControllers = [];
  late TextEditingController count;
  late int cumulativePrice  = 0;

  intialData() async {
    statusRequest = StatusRequest.loading;
    Item = Get.arguments["selectedItem"];
    item_info = Item?['info'] != null ? Item!['info'] :[] ;
    print(item_info);
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

    if(count.text == '' || count.text == '0'){
      Get.snackbar('Error', 'PLZ select count ');
      return;
    }
    var formdata = formstate.currentState;
    if(item_info.length == 0){
      var str_item_info = jsonEncode(item_info) ;
      var response = await cartData.addToCart(item_id, myServices.sharedPreference.getInt("id"),str_item_info,cumulativePrice,count.text);

      statusRequest = handlingData(response);
      if(StatusRequest.success == statusRequest){
        Get.snackbar(
            "Notificstion",
            "Added to cart"
        );
        count.text = '0';
        cumulativePrice = 0;
        update();
      }else{
        statusRequest = StatusRequest.failure;
      }
    }else{
      if(formdata!.validate() ){
        var str_item_info = jsonEncode(item_info) ;
        var response = await cartData.addToCart(item_id, myServices.sharedPreference.getInt("id"),str_item_info,cumulativePrice,count);

        statusRequest = handlingData(response);
        if(StatusRequest.success == statusRequest){
          Get.snackbar(
              "Notificstion",
              "Added to cart"
          );
          item_info = item_info.map((item)
            {
              return{
                'name': item['name'],
                'type': item['type'],
                'value': null,
              };
            }
          ).toList();
          for(var controller in textControllers){
            controller.text = '';
          }
          count.text = '0';
          cumulativePrice = 0;
          update();
        }else{
          statusRequest = StatusRequest.failure;
        }
      }
    }

  }

  removeFromCart(item_id) async {
    var response = await cartData.removeFromCart(item_id, myServices.sharedPreference.getInt("id"));

    statusRequest = handlingData(response);

    if(StatusRequest.success == statusRequest){
      Get.snackbar(
          "Notificstion",
          "Added to cart"
      );
    }else{
      statusRequest = StatusRequest.failure;
    }
  }

  @override
  increamentCountItemCart(){
    print('count.text');
    print(count.text);
    var numCount = 0;
    if(count.text != ''){
      numCount = int.parse(count.text);
    }
    numCount = numCount + 1;
    cumulativePrice = Item?['discount_price'] * numCount;
    count.text = numCount.toString();

    update();
  }

  @override
  decreamentCountItemCart(){
    var numCount = int.parse(count.text);
    if(numCount >0){
      numCount = numCount - 1;
      cumulativePrice = Item?['discount_price'] * numCount;
      count.text = numCount.toString();
      update();
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
     count = TextEditingController();
    super.onInit();
  }
}