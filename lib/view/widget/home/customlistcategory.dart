import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/home_controller.dart';
import 'package:handmade/core/functions/DBtranslation.dart';

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
                        color: AppColor.secondColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    height: 70,
                    width: 70,
                    child:
                    Image.network(Categories[index]["img_route"] ??'',color: AppColor.shadowPrimaryColor),

                  ),
                  Text(TransDB(Categories[index]["name"]?? ''),style: TextStyle(color: AppColor.black,fontSize: 13),)
                ],

              ),
            );
          },
        )
    );
  }
}
