
import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/homedata.dart';
import 'package:handmade/services/services.dart';


abstract class HomeController extends GetxController {
  initialDAta();
  getData();
  goToItems(List categories , int cat_id);
}

class HomeControllerImp extends HomeController {

  MyServices myServices = Get.find();
  String? username ;
  String? email ;
  String? phone ;
  String? img_route ;
  int? id;

  String? Lang;
  HomeData homeData = HomeData(Get.find());
  StatusRequest? statusRequest;
  List data = [];
  List categories = [];
  List items = [];



  @override
  initialDAta(){
    username  = myServices.sharedPreference.getString("username");
    id        = myServices.sharedPreference.getInt("id");
    email     = myServices.sharedPreference.getString("email");
    phone     = myServices.sharedPreference.getString("phone");
    img_route = myServices.sharedPreference.getString("img_route");

    Lang = myServices.sharedPreference.getString("lang");
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
    }
    update();
  }

  @override
  void onInit() {
    getData();
    initialDAta();
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
