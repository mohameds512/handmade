import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/order/order_details_controller.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handmade/core/functions/DBtranslation.dart';
import 'package:handmade/view/screen/order/ratingdialog.dart';
import 'package:handmade/view/widget/order/listorderitemsdetails.dart';
import 'package:shimmer/shimmer.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderDetailsController controller = Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details".tr),
      ),
      body:
      GetBuilder<OrderDetailsController>(builder:
          (controller) => HandlingDataView(
            loadingWidget: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white10,
              child:Text('ss'),
            ),
              statusRequest: controller.statusRequest,
              widget:
              Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    ...List.generate(
                      controller.orderItems.length,
                        (index) => 
                          ListOrderItemDetail(orderItem: controller.orderItems[index])

                    ),

                    if(controller.address != null)
                      Card(
                        child: Container(
                          child: ListTile(
                            title: Text("${controller.address!["name"]}",style: TextStyle(fontFamily: "sans",color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold )),
                            subtitle: Text("${controller.address!["city"]} _ ${controller.address!["street"]}"),
                          ),
                        ),
                      ),
                    if(controller.address != null)
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 300,
                        width: double.infinity,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          markers: controller.marker.toSet(),

                          initialCameraPosition: controller.kGooglePlex!,
                          onMapCreated: (GoogleMapController controllerMap) {
                            controller.completerController!.complete(controllerMap);
                          },
                        ),
                      )
                  ],
                ),
              ),
          ) ,
      )

    );
  }
}
