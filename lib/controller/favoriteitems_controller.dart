import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/favorite_controller.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/cat_items.dart';
import 'package:handmade/data/datasource/remote/favorite_data.dart';
import 'package:handmade/data/datasource/remote/favoriteitemsdata.dart';
import 'package:handmade/data/datasource/remote/homedata.dart';
import 'package:handmade/services/services.dart';

class FavoriteItemsController extends GetxController{

  MyServices myServices = Get.find();
  TextEditingController? search;

  List items = [];
  List searchItems = [];
  bool searchResolute = true;
  bool isSearch = false;

  @override
  changeCat(val) {

    update();
  }

  @override
  intialData() {
    update();
  }

  FavoriteItemsData favoriteItemsData = FavoriteItemsData(Get.find());
  late StatusRequest statusRequest;


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
  SearchItems(val) async {
    HomeData homeData = HomeData(Get.find());
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
  getFavoriteItems() async {

    items.clear();
    statusRequest = StatusRequest.loading;
    update();

    var response = await favoriteItemsData.getData(myServices.sharedPreference.getInt("id"));

    statusRequest = handlingData(response);
    update();
    if(response["status"] == "success"){
      items.addAll(response["data"]["items"]);
      update();
    }else{
      Get.defaultDialog(title: "Warning",middleText:  "Phone Number Or Email Already Exist");
    }
  }

  FavoriteData favoriteData = FavoriteData(Get.find());
  @override
  checkFavorite(id){

    var item = items.firstWhere((item) => item['id'] == id, orElse: () => null);

    if (item != null) {
      return item["fav"].toString();
    } else {
      return '0';
    }

  }
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
  removeFavorite(id){

    int index = items.indexWhere((item) => item['id'] == id);

    if (index != -1) {
      items.removeAt(index);
    } else {

    }
    update();
    favoriteData.getData(id,myServices.sharedPreference.getInt("id"));

  }
  @override
  void onInit() {
    getFavoriteItems();
    search = TextEditingController();
    super.onInit();
  }

  @override
  goToProductDetails(selectedItem) {

    Get.toNamed("productdetails", arguments: {
      "selectedItem" :selectedItem
    });
  }



}