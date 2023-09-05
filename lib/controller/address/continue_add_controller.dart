
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/address_data.dart';
import 'package:handmade/services/services.dart';
class ContinueAddressAddController extends GetxController{

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.loading;

  String? lat;
  String? long;
  late TextEditingController name ;
  late TextEditingController city ;
  late TextEditingController street;
  MyServices myServices = Get.find();
  initialData(){
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    lat = Get.arguments['lat'].toString();
    long = Get.arguments['long'].toString();
    statusRequest = StatusRequest.none;
    update();
  }

  AddressData addressData = AddressData(Get.find());
  @override

  AddAddress() async {
    var formdata = formstate.currentState;
    print("formdata $formdata");
    if(formdata!.validate() ) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await addressData.addData(
          myServices.sharedPreference.getInt("id").toString()!, name!.text, city!.text,
          street!.text, lat!, long!);
      statusRequest = handlingData(response);
      update();
      if (response["status"] == "success") {
        Get.offAllNamed(AppRoute.AddressView);
      } else {

        // Get.defaultDialog(title: "Warning",middleText:  "Phone Number Or Email Already Exist");
      }
      update();
    }else{
      print("fill fields ");
    }
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}