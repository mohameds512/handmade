import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/order/order_controller.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/view/widget/order/cardorderlist.dart';
import 'package:shimmer/shimmer.dart';
class PendingOrder extends StatelessWidget {
  const PendingOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.put(OrderController());

    return Scaffold(
      appBar: AppBar(
        title: Text("Orders".tr),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<OrderController>(builder: (controller)=>
            HandlingDataView(
                loadingWidget: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.white10,
                  child:Text('ss'),
                ),
            statusRequest: controller.statusRequest,
            widget:
            ListView.builder(
                itemCount: controller.ordersList.length,
                itemBuilder: ((context, index)=>
                CardOrderList(
                  order_id:controller.ordersList[index]["id"].toString() ,
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
                  onPressedDelete: (){
                    controller.DeleteOrder(controller.ordersList[index]["id"].toString());
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
