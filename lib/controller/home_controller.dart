
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/API/firebase_api.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/core/functions/DBtranslation.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/chat/chat_data.dart';
import 'package:handmade/data/datasource/remote/homedata.dart';
import 'package:handmade/services/services.dart';


abstract class HomeController extends GetxController {
  initialDAta();
  getData();
  getUnseen();
  goToItems(List categories , int cat_id);
  TextEditingController? search;
}

class HomeControllerImp extends HomeController {

  MyServices myServices = Get.find();
  String? curLat;
  String? curLong;
  String? username ;
  String? email ;
  String? phone ;
  String? img_route ;
  int? id;
  Map SettingData = {};
  String? Lang;
  HomeData homeData = HomeData(Get.find());
  StatusRequest? statusRequest;
  List data = [];
  List categories = [];
  List items = [];
  List Nearest = [];
  List top_sealing_items = [];
  List searchItems = [];
  bool searchResolute = true;
  bool isSearch = false;
  late String unseenCount = '0';
  checkSearch(val){
    if(val == ""){
      isSearch = false;
    }else{
      isSearch = true;
      SearchItems(val);
    }
    update();
  }
  @override
  initialDAta(){
    username  = myServices.sharedPreference.getString("username");
    id        = myServices.sharedPreference.getInt("id");
    email     = myServices.sharedPreference.getString("email");
    phone     = myServices.sharedPreference.getString("phone");
    img_route = myServices.sharedPreference.getString("img_route");

    Lang = myServices.sharedPreference.getString("lang");
    curLat = myServices.sharedPreference.getDouble("curLat").toString();
    curLong = myServices.sharedPreference.getDouble("curLong").toString();
    update();

  }


  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      categories.addAll(response["data"]["data"]["categories"]);
      items.addAll(response["data"]["data"]["items"]);
      top_sealing_items.addAll(response["data"]["data"]["top_sealing"]);

      if(response["data"]["data"]["setting"] != null){
        SettingData = response["data"]["data"]["setting"];
      }
    }
    update();
    await FirebaseApi().initNotification();
  }

  @override
  getNearest() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getNearest(curLat, curLong, 100,200000);

    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      Nearest.addAll(response["data"]["items"]);
    }
    update();
  }

  @override
  SearchItems(val) async {
    statusRequest = StatusRequest.loading;
    searchItems.clear();
    searchResolute = true;
    var response = await homeData.searchItems(val);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){

      if(response["status"] == "success"){

        searchItems.addAll(response["data"]["items"]);
      }else{
        searchResolute = false;

      }
    }
    update();
  }
  getUnseen()async{
    ChatData chatData = ChatData(Get.find());
    var response = await chatData.getCount(myServices.sharedPreference.getInt("id").toString());
    unseenCount = response['count'].toString();

    update();
  }

  @override
  goToProductDetails(selectedItem) {

    Get.toNamed("productdetails", arguments: {
      "selectedItem" :selectedItem
    });
  }

  @override
  void onInit() {

    getData();
    initialDAta();
    getNearest();
    getUnseen();
    search = TextEditingController();
    super.onInit();
  }

  @override
  goToItems(categories,cat_id) {
    Get.toNamed(AppRoute.items,arguments: {
      "categories" : categories,
      "cat_id" : cat_id
    });
  }
}
