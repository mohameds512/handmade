import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/home_controller.dart';
import 'package:handmade/core/functions/DBtranslation.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constant/color.dart';

class CustomNearestItems extends GetView<HomeControllerImp> {
  final List Items;
  final String? Lang;
  const CustomNearestItems({Key? key, required this.Items,required this.Lang}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        child:
          SizedBox(
          height: 160,
          child: ListView.builder(
              itemCount: Items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context , i){
                return Stack(
                  children: [
                    InkWell(
                      onTap: (){
                        controller.goToProductDetails(Items[i]);
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 80,
                            width: 80,
                            margin: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                            decoration: BoxDecoration(
                                // shape: BoxShape.circle,
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: CachedNetworkImageProvider(Items[i]["img_route"]),
                                )
                            ),


                          ),
                          Text(TransDB(Items[i]["name"]?? ''),style: TextStyle(color: AppColor.black,fontSize: 13),)
                        ],

                      ),

                    ),
                    Positioned(
                      top: 0,
                      right: Lang != 'ar' ? 0 : null,
                      left: Lang == 'ar' ? 0 : null,
                      child: Row(
                        children: [
                          Text(getDistance(Items[i]["distance"]),style: TextStyle(color: AppColor.green,),),
                          Text(' KM '.tr,style: TextStyle(fontFamily: "sans",fontWeight: FontWeight.bold,color: AppColor.green,))
                        ],
                      )
                    )
                  ],
                );

              }
          ),
        )
      );

  }
}
getDistance(dis){
   final val = dis;
   return val.toStringAsFixed(1);
}