import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/productDetails_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:handmade/core/constant/color.dart';
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
          top: 70.0,
          right: Get.width/10,
          left: Get.width/10,
          child: Center(
            child: Hero(
              tag: controllerImp.Item?["id"]!,
              child: CachedNetworkImage(
                imageUrl: controllerImp.Item?["img_route"]!,
                height: 150,
                fit: BoxFit.fill,
              ),
            ),
          ),)
      ],
    );
  }
}
