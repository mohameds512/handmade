import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/order_data.dart';
import 'package:handmade/services/services.dart';

class OrderController extends GetxController{

  List ordersList = [];

  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  OrderData orderData = Get.put(OrderData(Get.find()));

  getPendingOrder() async{
    statusRequest = StatusRequest.loading;
    ordersList.clear();
    update();
    var response = await orderData.getOrders(myServices.sharedPreference.getInt("id").toString());
    print("response");
    print(response);
    statusRequest = handlingData(response);
    print("statusRequest");
    print(statusRequest);
    if(StatusRequest.success == statusRequest ){
      ordersList = response["orders"];
    }
    update();
  }

  refreshOrders() async{
    // statusRequest = StatusRequest.loading;
    ordersList.clear();
    // update();
    var response = await orderData.getOrders(myServices.sharedPreference.getInt("id").toString());
    print("response");
    print(response);
    statusRequest = handlingData(response);
    print("statusRequest");
    print(statusRequest);
    if(StatusRequest.success == statusRequest ){
      ordersList = response["orders"];
    }
    update();
  }
  @override
  void onInit() {
    getPendingOrder();
    super.onInit();
  }

}