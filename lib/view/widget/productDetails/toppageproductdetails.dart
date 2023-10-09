import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/productDetails_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:handmade/core/constant/ImageAssets.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/functions/DBtranslation.dart';
import 'package:handmade/view/screen/full_screen.dart';
class TopPageProductDetails extends GetView<ProductDetailsControllerImp> {
  const TopPageProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controllerImp = Get.put(ProductDetailsControllerImp());
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 180,
          decoration: const BoxDecoration(
            color: AppColor.primaryColor,
            // borderRadius: BorderRadius.vertical(bottom: Radius.circular(40),),
          ),
        ),
        Positioned(
          top: 50.0,
          right: Get.width/10,
          left: Get.width/10,
          child: Center(
            child: GestureDetector(
              child: Hero(
                tag: controllerImp.Item?["id"]!,
                child: CachedNetworkImage(
                  imageUrl: controllerImp.Item?["img_route"]!,
                  height: 170,
                  fit: BoxFit.fill,
                ),

              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return DetailScreen(ImgUrl: controllerImp.Item?["img_route"]!,productName: TransDB(controllerImp.Item?["name"]!),);
                }));
              },
            ),
          ),
        ),
        if(controllerImp.Item?["discount"] != 0) Positioned(
            top: 4,
            left: 4,
            child: Image.asset(AppImageAssets.sale1,height: 40,)
        )
      ],
    );
  }
}

