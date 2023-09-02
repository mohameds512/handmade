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
class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController  = Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<CartController>(builder: (controller) =>
          CustomBottomNavigationBarCart(price: "${cartController.totalPrice}", shipping: "568 \$", TotalPrice: "135453 \$"),
      ),

      body: GetBuilder<CartController>(builder: ((controller)=>
      HandlingDataView(statusRequest: controller.statusRequest,
          widget:ListView(
            children: [
              const TopAppBarCart(title: "My Cart"),
              const SizedBox(height: 10,),
              TopCardCart(desc: "You have ${controller.totalCount} items in your cart"),
              Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    ...List.generate(
                      cartController.cartItems.length
                      , (index) =>
                        CustomCardList(
                            onAdd: (){
                              cartController.addToCartFromCart(cartController.cartItems[index]["id"]!);
                            },
                            onRemove: (){
                              cartController.removeFromCartFromCart(cartController.cartItems[index]["id"]!);
                            },
                            name: TransDB(cartController.cartItems[index]["name"]),
                            price: "${cartController.cartItems[index]["all_price"].toStringAsFixed(2)} \$",
                            count: cartController.cartItems[index]["item_count"].toString(),
                            imgLink: cartController.cartItems[index]["img_route"],
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
