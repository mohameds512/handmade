import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/notification_data.dart';
import 'package:handmade/services/services.dart';

class NotificationController extends GetxController{
  List Notfs = [];
  MyServices myServices = Get.find();
  late StatusRequest statusRequest ;
  NotificationData notificationData = NotificationData(Get.find());

  getNotfs()async{
    statusRequest = StatusRequest.loading;
    Notfs.clear();
    update();
    var response = await notificationData.getData(myServices.sharedPreference.getInt("id").toString());
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
        Notfs = response['notifications'];
        update();
    }
  }
  refreshNotf()async{
    Notfs.clear();
    var response = await notificationData.getData(myServices.sharedPreference.getInt("id").toString());
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      Notfs = response['notifications'];
      update();
    }
  }

  @override
  void onInit() {
    getNotfs();
    super.onInit();
  }
}