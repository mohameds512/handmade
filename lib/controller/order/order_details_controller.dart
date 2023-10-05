import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:get/get.dart';
import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/data/datasource/remote/order_data.dart';

class OrderDetailsController extends GetxController{

  Completer<GoogleMapController>? completerController ;

  List<Marker> marker =[];
  late double lat;
  late double long;
  Map? address;
  // LatLng targetPos = LatLng(37.42796133580664, -122.085749655962);
  late LatLng targetPos ;
  List orderItems = [];
  late Map orderDetail ;
  OrderData orderData = OrderData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  CameraPosition? kGooglePlex ;

  refreshOrderDetails()async{
    print("case 1");
    var response = await orderData.getOrderDetails(orderDetail["id"].toString());
    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      orderItems = response["data"]["items"];
      update();
    }
    print("case 2");
  }
  getOrderDetails() async {

    orderItems.clear();
    address = null;
    statusRequest = StatusRequest.loading;
    update();
    // print("object_id : $orderDetail['id'] ");
    var response = await orderData.getOrderDetails(orderDetail["id"].toString());

    statusRequest = handlingData(response);
    if(StatusRequest.success == statusRequest){
      address = response["data"]["address"];

      orderItems = response["data"]["items"];

      targetPos = LatLng(address!["address_lat"],address!["address_long"]);

    }

    kGooglePlex = CameraPosition(
        bearing: 192.8334901395799,
        target:  targetPos,
        // target:  LatLng(double.parse(address!["address_lat"]),double.parse( address!["address_long"])),
        // target: LatLng(lat, long),
        tilt: 59.440717697143555,
        zoom: 18
    );
    marker.add(Marker(markerId: MarkerId("1"),position: targetPos));
    update();
  }

  // intialData(){
  //
  //   kGooglePlex = CameraPosition(
  //       bearing: 192.8334901395799,
  //       target:  targetPos,
  //       // target:  LatLng(double.parse(address!["address_lat"]),double.parse( address!["address_long"])),
  //       // target: LatLng(lat, long),
  //       tilt: 59.440717697143555,
  //       zoom: 18
  //   );
  //   marker.add(Marker(markerId: MarkerId("1"),position: targetPos));
  // }

  @override
  void onInit() {
    orderDetail = Get.arguments["orderDetails"];
    getOrderDetails();
    // intialData();
    super.onInit();
  }
}