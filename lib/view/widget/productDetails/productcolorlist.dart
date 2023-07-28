import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/productDetails_controller.dart';
import 'package:handmade/core/constant/color.dart';

class ProductColorList extends GetView<ProductDetailsControllerImp> {
  const ProductColorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controllerImp = Get.put(ProductDetailsControllerImp());
    return Row(
      children: [
        ...List.generate(controllerImp.itemColors.length,
              (index) =>
              Container(

                height: 60,width: 60,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 10),
                padding: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  // color: AppColor.redColor,
                    border: Border.all(color: AppColor.redColor),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text(controllerImp.itemColors[index],style: TextStyle(color: AppColor.secondColor,fontWeight: FontWeight.bold),),
              ),
        )

      ],
    );
  }
}
