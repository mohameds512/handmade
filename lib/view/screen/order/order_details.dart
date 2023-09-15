import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/order/order_details_controller.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handmade/core/functions/DBtranslation.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderDetailsController controller = Get.put(OrderDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Details"),
      ),
      body:

      GetBuilder<OrderDetailsController>(builder:
          (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget:Container(
                padding: EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Card(
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: [
                            Table(
                              children: [
                                TableRow(
                                    children: [
                                      Text("Product",textAlign: TextAlign.center,style: TextStyle(color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold),),
                                      Text("Count",textAlign: TextAlign.center,style: TextStyle(color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold)),
                                      Text("Price",textAlign: TextAlign.center,style: TextStyle(color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold)),
                                    ]
                                ),
                                ...List.generate(
                                      controller.orderItems.length,
                                       (index) => TableRow(
                                           children: [
                                             Text(TransDB(controller.orderItems[index]["name"]),textAlign: TextAlign.center,),
                                             Text(controller.orderItems[index]["item_count"].toString(),textAlign: TextAlign.center),
                                             Text(controller.orderItems[index]["all_price"].toStringAsFixed(2),textAlign: TextAlign.center,),
                                           ]
                                       )
                                )

                              ],
                            ),
                            SizedBox(height: 10,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text("Total Price : 1564 \$" ,style: TextStyle(fontFamily: "sans",color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold ),textAlign: TextAlign.center,),

                            ),
                          ],
                        ),
                      ),
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
