
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:handmade/controller/productDetails_controller.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/core/functions/DBtranslation.dart';
import 'package:handmade/core/functions/validinput.dart';
import 'package:handmade/view/widget/auth/customtextformauth.dart';
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
            controller.addToCart(controllerImp.Item!["id"]);
            // controllerImp.cartController.viewCart();
            // Get.toNamed(AppRoute.cart);
          },
          child: Text("Add to Card",style: TextStyle(color: AppColor.whiteColor,fontWeight: FontWeight.bold),),
        ),
      ),
      body: GetBuilder<ProductDetailsControllerImp>(builder: (controllerImp)=>HandlingDataView(
          statusRequest: controllerImp.statusRequest,
          widget:
              ListView(
                children: [
                  TopPageProductDetails(),
                  const SizedBox(height: 30,),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                        controllerImp.item_info.length > 0 ?
                        Flexible(
                          flex: 1,
                            child: Form(
                              key: controllerImp.formstate,
                              child: ListView.builder(
                                  itemCount: controllerImp.item_info.length,
                                  shrinkWrap: true,
                                  physics: ScrollPhysics(),
                                  itemBuilder: (context,index){
                                    TextEditingController controller = TextEditingController();
                                    controllerImp.textControllers.add(controller);
                                    return
                                      Container(
                                        padding: EdgeInsets.symmetric(vertical: 10),
                                        child: TextFormField(
                                          onTapOutside: (event)=>FocusScope.of(context).unfocus(),
                                          keyboardType: controllerImp.item_info[index]["type"] == 2 ? TextInputType.number : TextInputType.text,
                                          validator: (val){
                                            return validInput(val!, 1, 5, "number");
                                          },
                                          controller: controllerImp.textControllers[index],
                                          onChanged: (val){
                                            controllerImp.item_info[index]["value"] = val;
                                          },
                                          decoration: InputDecoration(
                                            hintText: controllerImp.item_info[index]["name"],
                                            hintStyle: const TextStyle(fontSize: 13,color: AppColor.grey),
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 35),
                                            suffixIconColor: AppColor.grey,
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(30)
                                            ),

                                          ),

                                        ),
                                      );
                                  }
                              ),
                            )

                        ): Text("")



                      ],
                    ),
                  )
                ],
              )

          )
      ),

    );
  }
}
