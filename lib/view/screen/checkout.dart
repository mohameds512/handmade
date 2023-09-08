import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/checkout/checkout_controller.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/ImageAssets.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/view/widget/checkout/cardAddress.dart';
import 'package:handmade/view/widget/checkout/cardDeliverytype.dart';
import 'package:handmade/view/widget/checkout/cardpaymentmethod.dart';
import 'package:get/get.dart';
class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child:
        MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: (){
          controller.checkOrder();
        },
        child: Text("Check Out",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      ),
      body: GetBuilder<CheckoutController>(builder: (controller) =>
          Container(
            padding: EdgeInsets.all(20),
            child: ListView(
              children: [
                Text("Choose Payment Method",style: TextStyle(color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold),),

                InkWell(
                    onTap: (){
                      controller.choosePaymentMethod("Cash");
                    },
                    child: CardPaymentMethodCheckOut(
                        title: "Cash",
                        isActive: controller.paymentMethod == "Cash" ? true : false
                    )
                ),
                InkWell(
                    onTap: (){
                      controller.choosePaymentMethod("VISA or Card");
                    },
                    child: CardPaymentMethodCheckOut(
                        title: "VISA or Card",
                        isActive: controller.paymentMethod == "VISA or Card" ? true : false
                    )
                ),

                SizedBox(height: 20,),
                Text("Choose Delivery Type",style: TextStyle(color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),

                Row(

                  children: [
                    InkWell(
                        onTap: (){
                          controller.chooseDeliveryType("Delivery");
                        },
                        child: CardDeliveryTypeCheckout(
                            imgName: AppImageAssets.logo,
                            title: "Delivery",
                            isActive: controller.deliveryType == "Delivery" ? true : false
                        )
                    ),
                    const SizedBox(width: 20,),
                    InkWell(
                        onTap: (){
                          controller.chooseDeliveryType("Drive Thru");
                        },
                        child: CardDeliveryTypeCheckout(
                            imgName: AppImageAssets.logo,
                            title: "Drive Thru",
                            isActive: controller.deliveryType == "Drive Thru" ? true : false
                        )
                    ),

                  ],
                ),
                const SizedBox(height: 20,),
                if(controller.deliveryType == "Delivery")
                  HandlingDataView(
                      statusRequest: controller.statusRequest,
                      widget:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Shipping Address",style: TextStyle(color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold),),
                          const SizedBox(height: 10,),
                          ...List.generate(
                              controller.addresses.length,
                                  (index) => InkWell(
                                    onTap: (){
                                      controller.chooseShippingAddressId(controller.addresses[index]["id"]);
                                    },
                                    child: CardAddressCheckOut(
                                        title: controller.addresses[index]["name"],
                                        subTitle: "${controller.addresses[index]["city"]} ${controller.addresses[index]["street"]}",
                                        isActive: controller.addressId == controller.addresses[index]["id"] ? true : false
                                    ),
                                  ),

                          ),

                        ],
                      ),

                  )


              ],

            ),
          ),


      )


    );
  }
}
