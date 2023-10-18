import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/home_controller.dart';
import 'package:handmade/core/functions/DBtranslation.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/constant/color.dart';
import 'package:get/get.dart';
class CustomListCategory extends GetView<HomeControllerImp> {

  final List Categories;
  const CustomListCategory({Key? key, required this.Categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: ListView.separated(
          separatorBuilder: (context,index)=>const SizedBox(width: 15,),
          itemCount: Categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , index){
            return InkWell(
              onTap: (){
                controller.goToItems(Categories,Categories[index]["id"]);
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        // borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: CachedNetworkImageProvider(Categories[index]["img_route"]),
                        )
                    ),
                    height: 70,
                    width: 70,
                    // child:
                    // CachedNetworkImage(imageUrl: Categories[index]["img_route"],fit: BoxFit.fill,)
                    // Image.network(Categories[index]["img_route"] ??'',fit: BoxFit.cover,),

                  ),
                  Text(TransDB(Categories[index]["name"]?? ''),style: TextStyle(color: AppColor.grey_2,fontSize: 13),)
                ],

              ),
            );
          },
        )
    );
  }
}
