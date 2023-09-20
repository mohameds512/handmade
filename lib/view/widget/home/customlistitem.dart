import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/home_controller.dart';
import 'package:handmade/core/functions/DBtranslation.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class CustomListItem extends GetView<HomeControllerImp> {
  final List Items;
  const CustomListItem({Key? key, required this.Items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 120,
      child: ListView.builder(
          itemCount: Items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context , i){
            return InkWell(
              onTap: (){
                controller.goToProductDetails(Items[i]);
              },
              child:  Stack(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                      child: Image.network(Items[i]['img_route'],width: 120,height: 90,)
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.secondColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    height: 100,
                    width: 140,

                  ),
                  Positioned(
                      left:5,
                      top:5,
                      child:
                      Text(
                        TransDB(Items[i]["name"]??'') ,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),)
                  )
                ],
              ),
            )
             ;
          }
      ),
    );
  }
}
