import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/items_controller.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/favorite_data.dart';
import 'package:handmade/data/datasource/remote/homedata.dart';
import 'package:handmade/data/datasource/remote/offer_data.dart';
import 'package:handmade/data/datasource/remote/test_data.dart';
import 'package:handmade/services/services.dart';
class OfferController extends GetxController{
  OfferData offerData = OfferData(Get.find());
  TextEditingController? search;
  MyServices myServices = Get.find();

  List items = [];

  List searchItems = [];
  bool searchResolute = true;
  bool isSearch = false;
  late StatusRequest statusRequest;
  getData() async {
    print("sssssssssssddddddds");
    statusRequest = StatusRequest.loading;
    items.clear();
    update();
    var response = await offerData.getData();
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){

      items = response["data"]["data"]["items"];

    }
    update();
  }

  checkSearch(val){
    if(val == ""){
      isSearch = false;
    }else{
      isSearch = true;
      SearchItems(val);
    }
    update();
  }


  HomeData homeData = HomeData(Get.find());

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




  @override
  checkFavorite(id){

    var item = items.firstWhere((item) => item['id'] == id, orElse: () => null);

    if (item != null) {
      return item["fav"].toString();
    } else {
      return '0';
    }

  }
  FavoriteData favoriteData = FavoriteData(Get.find());

  @override
  setFavorite(id,val){

    int index = items.indexWhere((item) => item['id'] == id);

    if (index != -1) {
      items[index]['fav'] = val;
    } else {

    }
    update();
    favoriteData.getData(id,myServices.sharedPreference.getInt("id"));

  }

  @override
  goToProductDetails(selectedItem) {

    Get.toNamed("productdetails", arguments: {
      "selectedItem" :selectedItem
    });
  }
  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }
}