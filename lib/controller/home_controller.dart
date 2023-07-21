
import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/homedata.dart';
import 'package:handmade/services/services.dart';


abstract class HomeController extends GetxController {
  initialDAta();
  getData();
}

class HomeControllerImp extends HomeController {

  MyServices myServices = Get.find();
  String? username ;
  String? email ;
  String? phone ;
  int? id;

  HomeData homeData = HomeData(Get.find());
  StatusRequest? statusRequest;
  List data = [];
  List categories = [];



  @override
  initialDAta(){
    username  = myServices.sharedPreference.getString("username");
    id        = myServices.sharedPreference.getInt("id");
    email     = myServices.sharedPreference.getString("email");
    phone     = myServices.sharedPreference.getString("phone");
    update();

  }


  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      categories.addAll(response["data"]["data"]["categories"]);
    }
    update();
  }

  @override
  void onInit() {
    getData();
    initialDAta();
    super.onInit();
  }
}
