import 'package:get/get.dart';
import 'package:handmade/controller/order/order_details_controller.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/archive_data.dart';
import 'package:handmade/data/datasource/remote/order_data.dart';
import 'package:handmade/services/services.dart';

class ArchivedController extends GetxController{

  List ordersList = [];

  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  ArchiveData archiveData = Get.put(ArchiveData(Get.find()));

  getArchivedOrder() async{
    statusRequest = StatusRequest.loading;
    ordersList.clear();
    update();
    var response = await archiveData.getArchivedOrders(myServices.sharedPreference.getInt("id").toString());
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

  submitRating(order_id,item_id,rating,notes) async{

    print("order_id : $order_id");
    print("item_id : $item_id");
    var response = await archiveData.submitRating(order_id,item_id,rating,notes);
    print("case 3");
    OrderDetailsController orderDetailsController = Get.put(OrderDetailsController());
    orderDetailsController.refreshOrderDetails();
    print("case 4");
  }
  refreshOrders() async{
    // statusRequest = StatusRequest.loading;
    // ordersList.clear();
    // update();
    var response = await archiveData.getArchivedOrders(myServices.sharedPreference.getInt("id").toString());

    statusRequest = handlingData(response);

    if(StatusRequest.success == statusRequest ){
      ordersList = response["orders"];
    }
    update();
  }
  @override
  void onInit() {
    getArchivedOrder();
    super.onInit();
  }

}