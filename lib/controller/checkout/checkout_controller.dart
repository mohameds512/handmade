import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/address_data.dart';
import 'package:handmade/data/datasource/remote/order_data.dart';
import 'package:handmade/services/services.dart';

class CheckoutController extends GetxController{

  AddressData addressData = Get.put(AddressData(Get.find()));
  OrderData orderData = Get.put(OrderData(Get.find()));
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  StatusRequest statusRequestCheckOrder = StatusRequest.none;
  String? paymentMethod;
  String? deliveryType;
  int? addressId;
  List addresses = [];
  late String coupon_id;
  late String order_price;

  choosePaymentMethod(String val){
    paymentMethod = val ;
    update();
  }
  chooseDeliveryType(String val){
    deliveryType = val;
    update();
  }
  chooseShippingAddressId(int val){
    addressId = val;
    update();
  }

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


  checkOrder() async {

    // statusRequest = StatusRequest.loading;
    Map data={
      "user_id": myServices.sharedPreference.getInt("id").toString(),
      "address_id": addressId.toString(),
      "coupon_id": coupon_id,
      "shipping_type": deliveryType ,
      "payment_method":paymentMethod ,
      "shipping_price": "10",
      "orders_peice": order_price,
    };
    var response = await orderData.addData(data);

    statusRequestCheckOrder = handlingData(response);
    if(StatusRequest.success == statusRequestCheckOrder){
      print("success");
      print(response);
    }else{
      print("failure");
    }
    update();
  }

  @override
  void onInit() {
    coupon_id = Get.arguments['coupon_id'];
    order_price = Get.arguments['totalPrice'];
    getAddresses();
    super.onInit();
  }
}
