import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/constant/routes.dart';
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
  late String order_total_price;
  late String order_price;
  late String discount = "0";

  choosePaymentMethod(String val){
    paymentMethod = val ;
    update();
  }
  chooseDeliveryType(String val){
    deliveryType = val;
    if(addresses.length == 0 && val == "0"){
      Get.snackbar('Alert', 'PLZ add address to continue');
    }
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
    if(paymentMethod == null) return Get.snackbar("Error", "Please select payment method");
    if(deliveryType == null) return Get.snackbar("Error", "Please select delivery type");
    if(deliveryType == "0" && addressId == null ) return Get.snackbar("Error", "Please select address");
    // statusRequest = StatusRequest.loading;
    Map data={
      "user_id": myServices.sharedPreference.getInt("id").toString(),
      "address_id": addressId.toString(),
      "coupon_id": coupon_id,
      "shipping_type": deliveryType ,
      "payment_method":paymentMethod ,
      "shipping_price": "10",
      "orders_price": order_price,
      "order_total_price": order_total_price,
      "discount": discount,
    };
    var response = await orderData.addData(data);

    statusRequestCheckOrder = handlingData(response);
    if(StatusRequest.success == statusRequestCheckOrder){
      Get.snackbar("CheckOut", "Successfully");
      Get.offAllNamed(AppRoute.home);

    }else{
      Get.snackbar("CheckOut", "Something wont wrong");
      print("failure");
    }
    update();
  }

  @override
  void onInit() {
    coupon_id = Get.arguments['coupon_id'].toString();
    order_total_price = Get.arguments['totalPrice'];
    order_price = Get.arguments['Price'];
    discount = Get.arguments['couponDiscount'].toString();
    getAddresses();
    super.onInit();
  }
}
