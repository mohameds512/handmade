
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

import 'package:handmade/core/class/statusrequest.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/constant/routes.dart';
class AddressAddController extends GetxController{
  Completer<GoogleMapController>? completerController ;
  Position? currentPosition;
  List<Marker> marker =[];
  double? lat;
  double? long;
  StatusRequest statusRequest = StatusRequest.loading;


  CameraPosition? kGooglePlex ;

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414
  );

  goToAddContinue(){
    Get.toNamed(
        AppRoute.addressAddContinue,
        arguments: {
        "lat":lat,
        "long":long,
        }
    );
  }
  selectCurrentLocation(){
    marker.clear();
    marker.add(Marker(markerId: MarkerId("1"),position: LatLng(currentPosition!.longitude,currentPosition!.longitude) ));
    lat = currentPosition!.latitude;
    long = currentPosition!.longitude;
    update();
    print(marker);
  }
  addMarkers(LatLng latLng){
    marker.clear();
    marker.add(Marker(markerId: MarkerId("1"),position: latLng));
    lat = latLng.latitude;
    long = latLng.longitude;
    update();
    print(marker);


  }
  getCourentPosition() async {
    currentPosition = await Geolocator.getCurrentPosition();
    kGooglePlex = CameraPosition(
        // target:  LatLng(37.42796133580664, -122.085749655962),
        target: LatLng(currentPosition!.latitude , currentPosition!.longitude),
        zoom: 15
    );
    statusRequest = StatusRequest.none;
    update();
    await Future.delayed(Duration(milliseconds: 400));
    Get.snackbar("Note", "Select your current Location OR the location you need by click on it",backgroundColor: AppColor.thirdColor);

  }
  @override
  void onInit() {
    completerController = Completer<GoogleMapController>();
    getCourentPosition();
    super.onInit();
  }
}