import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/cart/cart_controller.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/ImageAssets.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/functions/DBtranslation.dart';
import 'package:handmade/view/widget/cart/appbarcart.dart';
import 'package:handmade/view/widget/cart/buttonorder.dart';
import 'package:handmade/view/widget/cart/custombottomnavigationbarcart.dart';
import 'package:handmade/view/widget/cart/customcardlist.dart';
import 'package:handmade/view/widget/cart/topcardcart.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController  = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart".tr),
      ),
      bottomNavigationBar: GetBuilder<CartController>(builder: (controller) =>
          CustomBottomNavigationBarCart(price: "${cartController.Price}",
              // discount: "568 %",
            shipping: "10 \$",
            TotalPrice: "${controller.getTotalPrice()} \$",
            controllerCoupon: controller.controllerCoupon,
            onApplyCoupon: (){
              controller.checkCoupon();
            },
            couponDiscount: controller.couponDiscount,
            couponName: controller.couponName,
          ),
      ),

      body: GetBuilder<CartController>(builder: ((controller)=>
      HandlingDataView(
        loadingWidget: Shimmer.fromColors(
          baseColor: Colors.grey,
          highlightColor: Colors.white10,
          child:Text('ss'),
        ),
        statusRequest: controller.statusRequest,
          widget:ListView(
            children: [
              const SizedBox(height: 10,),
              TopCardCart(desc: "You have".tr + " ${controller.totalCount} " +"items in your cart".tr),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ...List.generate(
                      cartController.cartItems.length,
                       (index) =>
                        CustomCardList(
                            onAdd: (){
                              cartController.addToCartFromCart(cartController.cartItems[index]["id"]!);
                            },
                            onRemove: (){
                              cartController.removeFromCartFromCart(cartController.cartItems[index]["cart_id"]!);
                            },
                            name: TransDB(cartController.cartItems[index]["name"]),
                            price: "${cartController.cartItems[index]["cumulativePrice"]} \$",
                            count: cartController.cartItems[index]["quantity"].toString(),
                            imgLink: cartController.cartItems[index]["img_route"],
                            status: cartController.cartItems[index]["status"],
                            Item_info: cartController.cartItems[index]["item_info"],
                            lang:cartController.curr_lang ,
                        ),
                      )

                  ],
                ),
              )
            ],
          ),
      )
      ),
      )
    );
  }
}
