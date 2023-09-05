import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/address_data.dart';
import 'package:handmade/data/datasource/remote/test_data.dart';
import 'package:handmade/services/services.dart';
class ViewAddressController extends GetxController{

  MyServices myServices = Get.find();

  AddressData addressData = AddressData(Get.find());
  List addresses = [];
  late StatusRequest statusRequest;

  getAddresses() async {

    addresses.clear();
    statusRequest = StatusRequest.loading;
    var response = await addressData.getAddresses(myServices.sharedPreference.getInt("id").toString()!);
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      // addresses.add(response["addresses"]);
      addresses = response["addresses"];
    }
    update();
  }

  deleteAddress(address_id) async{
      addresses.removeWhere((element) => element["id"] == address_id);
      update();
      var response = await addressData.deleteAddress(address_id.toString());

  }
  @override
  void onInit() {
    getAddresses();
    super.onInit();
  }
}