import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
class AddressAddController extends GetxController{
  Completer<GoogleMapController>? completerController ;

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414
  );

  @override
  void onInit() {
    completerController = Completer<GoogleMapController>();
    super.onInit();
  }
}