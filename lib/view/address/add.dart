import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handmade/controller/address/add_controller.dart';
import 'package:get/get.dart';

class addressAdd extends StatelessWidget {
  const addressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressAddController controllerMap = Get.put(AddressAddController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new address"),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child:
              GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: controllerMap.kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  controllerMap.completerController!.complete(controller);
                },
            )),
          ]
        ),
      ),
    );
  }
}
