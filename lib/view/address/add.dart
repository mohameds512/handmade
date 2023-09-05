import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handmade/controller/address/add_controller.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/view/widget/auth/custombuttonauth.dart';

class addressAdd extends StatelessWidget {
  const addressAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddressAddController controllerMap = Get.put(AddressAddController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Add address coords"),
      ),
      body: Container(
        child: GetBuilder<AddressAddController>(
          builder: (controllerMap)=>
              HandlingDataView(statusRequest: controllerMap.statusRequest,
                  widget:Column(
                      children: [
                        if(controllerMap.kGooglePlex != null)
                         Expanded(child:
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                GoogleMap(
                                  mapType: MapType.normal,
                                  markers: controllerMap.marker.toSet(),
                                  onTap: (latLong){
                                    controllerMap.addMarkers(latLong);
                                  },
                                  initialCameraPosition: controllerMap.kGooglePlex!,
                                  onMapCreated: (GoogleMapController controller) {
                                    controllerMap.completerController!.complete(controller);
                                  },
                                ),
                                if(controllerMap.marker.isNotEmpty)
                                Positioned(
                                  bottom: 10,
                                  child: Container(
                                    child: CustomButtonAuth(text: "Continue",
                                      onPressed: (){
                                          controllerMap.goToAddContinue();
                                      },),
                                  ),
                                ),
                                Positioned(
                                  top: 5,
                                  right: 5,
                                  child: Container(
                                    child:  MaterialButton(
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                      padding: const EdgeInsets.all(12),
                                      color: AppColor.shadowPrimaryColor,
                                      textColor: Colors.white,
                                      onPressed: () {
                                        controllerMap.selectCurrentLocation();
                                      },
                                      child: Text("select current location"),
                                    ),
                                  ),
                                )
                              ],
                            )
                         ),
                      ]
                  ),

              )
        )
        ,)


    );
  }
}
