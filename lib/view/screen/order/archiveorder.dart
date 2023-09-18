import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/order/archived_controller.dart';
import 'package:handmade/controller/order/order_controller.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/view/widget/order/cardorderlist.dart';
class ArchivedOrder extends StatelessWidget {
  const ArchivedOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ArchivedController controller = Get.put(ArchivedController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Orders"),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<ArchivedController>(builder: (controller)=>
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget:
                ListView.builder(
                    itemCount: controller.ordersList.length,
                    itemBuilder: ((context, index)=>
                        CardOrderList(
                          order_id:controller.ordersList[index]["id"].toString() ,
                          rating:controller.ordersList[index]["rating"].toString() ,
                          added_ago:controller.ordersList[index]["added_ago"] ,
                          orderNum: controller.ordersList[index]["order_code"].toString(),
                          DeliveryPrice:controller.ordersList[index]["shipping_price"].toString(),
                          DeliveryType: controller.ordersList[index]["shipping_type"],
                          orderPrice: controller.ordersList[index]["orders_price"].toString(),
                          totalPrice: controller.ordersList[index]["order_total_price"].toString(),
                          paymentMethod: controller.ordersList[index]["payment_method"],
                          status: controller.ordersList[index]["status"],
                          onPressedDetails: (){
                            Get.toNamed(
                                AppRoute.detailsOrder,
                                arguments: {
                                  "orderDetails" : controller.ordersList[index]
                                }
                            );
                          },

                        )
                    )
                )
            )
          // )
        ),
      ),
    );
  }
}
