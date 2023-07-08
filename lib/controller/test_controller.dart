import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/test_data.dart';
class TestController extends GetxController{
  TestData testData = TestData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    print('fff');
    print(response);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      data.add(response);
    }
    update();
  }
  @override
  void onInit() {
    getData();
    super.onInit();
  }
}