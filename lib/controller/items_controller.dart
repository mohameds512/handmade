import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/cat_items.dart';

abstract class ItemController extends GetxController{
 intialData();
 changeCat(int val);
 getCatItems(cat_i);
 goToProductDetails(selectedItem);
}

class ItemControllerImp extends ItemController{
  List categories = [];
  List items = [];
  int? cat_id ;


  @override
  changeCat(val) {
    cat_id = val;
    getCatItems(cat_id);
    update();
  }

  @override
  intialData() {
    categories = Get.arguments['categories'];
    cat_id = Get.arguments["cat_id"];

    update();
  }
  CatItemsData catItemsData = CatItemsData(Get.find());
  late StatusRequest statusRequest;
  @override
  getCatItems(cat_id) async {
    items.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await catItemsData.getData(cat_id!);

    statusRequest = handlingData(response);
    update();
    if(response["status"] == "success"){
      items.addAll(response["data"]["items"]);

      update();
    }else{
      Get.defaultDialog(title: "Warning",middleText:  "Phone Number Or Email Already Exist");
    }
  }
 @override
  void onInit() {
    intialData();
    getCatItems(cat_id);
    super.onInit();
  }

  @override
  goToProductDetails(selectedItem) {
    print("selectedItem");
    print(selectedItem);
    Get.toNamed("productdetails", arguments: {
      "selectedItem" :selectedItem
    });
  }



}