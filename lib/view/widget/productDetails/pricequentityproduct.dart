import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/productDetails_controller.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:get/get.dart';
class PriceQuentityProduct extends GetView<ProductDetailsControllerImp> {
  const PriceQuentityProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controllerImp = Get.put(ProductDetailsControllerImp());
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.add)),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(3)),
              child: Text(controllerImp.Item!["price"].toString(),style: TextStyle(fontFamily: "sans"),),
            ),
            IconButton(onPressed: (){}, icon: Icon(Icons.remove)),
          ],
        ),
        Spacer(),
        Text("${controllerImp.Item?["price"]} \$",style: TextStyle(color: AppColor.primaryColor,fontFamily: "sans"),),
      ],
    );
  }
}
