import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:handmade/controller/productDetails_controller.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/core/functions/DBtranslation.dart';
import 'package:handmade/view/widget/productDetails/pricequentityproduct.dart';
import 'package:handmade/view/widget/productDetails/productcolorlist.dart';
import 'package:handmade/view/widget/productDetails/toppageproductdetails.dart';

class ProductDetails extends GetView<ProductDetailsControllerImp> {
  const ProductDetails({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controllerImp = Get.put(ProductDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        height: 40,
        child: MaterialButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          color: AppColor.primaryColor,
          onPressed: (){
            // controllerImp.cartController.viewCart();
            Get.toNamed(AppRoute.cart);
          },
          child: Text("Goto Card",style: TextStyle(color: AppColor.whiteColor,fontWeight: FontWeight.bold),),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(builder: (controllerImp)=>HandlingDataView(
          statusRequest: controllerImp.statusRequest,
          widget: Container(
          child:ListView(
            children: [
              TopPageProductDetails(),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TransDB(controllerImp.Item?["name"]!),
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(height: 10,),
                    PriceQuentityProduct(),
                    const SizedBox(height: 10,),
                    Text(
                      TransDB(controllerImp.Item?["desc"]!),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 20,),
                    // Text(
                    //   "Color",
                    //   style: Theme.of(context).textTheme.displayLarge,
                    // ),
                    const SizedBox(height: 20,),
                    // ProductColorList(),
                  ],
                ),
              )
            ],
          ) )
      ),)

    );
  }
}
