import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/productDetails_controller.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:get/get.dart';
import 'package:handmade/core/functions/validinput.dart';
class PriceQuentityProduct extends GetView<ProductDetailsControllerImp> {
  const PriceQuentityProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controllerImp = Get.put(ProductDetailsControllerImp());
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: (){
              controller.increamentCountItemCart();
              // controller.addCountItemCart(controllerImp.Item!["id"]);
            } , icon: Icon(Icons.add)),
            SizedBox(
              width: 50,
              height: 40,
              child: TextFormField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                keyboardType: TextInputType.number,
                maxLength: 3,

                onChanged: (val){

                },
                textAlign: TextAlign.center,
                controller: controllerImp.count,
                decoration: InputDecoration(
                  counterText: "",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  suffixIconColor: AppColor.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            IconButton(onPressed: (){
              controller.decreamentCountItemCart();
              // controller.removeCountItemCart(controllerImp.Item!["id"]);

            }, icon: Icon(Icons.remove)),
          ],
        ),
        Spacer(),
        Column(
          children: [
            Text("${controllerImp.Item?["discount_price"]} \$",style: TextStyle(color: AppColor.primaryColor,fontFamily: "sans"),),
            controllerImp.cumulativePrice > 0 ?
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top:  BorderSide(width: 2,color: AppColor.primaryColor)
                ),

              ),
              child: Text("${controllerImp.cumulativePrice} \$",style: TextStyle(color: AppColor.primaryColor,),),
            ) : Text('')


          ],
        ),

        SizedBox(width: 10,),
        if(controllerImp.Item?["discount"] != 0)
        Text("${controllerImp.Item?["price"]} \$",style: TextStyle(decorationColor: AppColor.primaryColor, decorationThickness: 2.0,decoration: TextDecoration.lineThrough, fontFamily: "sans"),),
      ],
    );
  }
}
