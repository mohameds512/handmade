import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/home_controller.dart';
import 'package:handmade/core/functions/DBtranslation.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/constant/color.dart';

class CustomListItem extends GetView<HomeControllerImp> {
  final List Items;
  const CustomListItem({Key? key, required this.Items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 240,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: Items.length,
          itemBuilder: (context, i) => InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: () {
              controller.goToProductDetails(Items[i]);
            },
            child: Card(
              elevation: 2,
              child: Stack(
                children: [
                  Column(
                    children: [

                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(Items[i]["img_route"]),
                              ),
                            ),
                            height: 130,
                            width: 180,
                          ),
                          Positioned(
                              top: 10,
                              left: 10,
                              child:Container(
                                height: 28,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: AppColor.darkColor,
                                    borderRadius: BorderRadius.circular(5)
                                ),
                                child:  i == 0 ? Icon(
                                  Icons.favorite_outlined,
                                  color: AppColor.secondColor,
                                  size: 18,
                                ) : Icon(
                                  Icons.favorite_border_outlined,
                                  color: AppColor.secondColor,
                                  size: 18,
                                ),
                              )
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Container(
                              height: 28,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: AppColor.darkColor,
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    CupertinoIcons.star,
                                    color: AppColor.secondColor,
                                    size: 18,
                                  ),
                                  Text("7.2",style: TextStyle(color: AppColor.secondColor),)
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 102,
                            width: 180,
                            decoration: BoxDecoration(
                              color:AppColor.mintColor,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10)
                              )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 6,right: 5),
                                  child: Text(
                                    TransDB(Items[i]["name"] ?? ''),
                                    style: TextStyle( fontSize: 18,fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 5),
                                  child: Text(
                                    TransDB(Items[i]["desc"] ?? ''),
                                    style: TextStyle( color: AppColor.darkMintColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 8,
                              left: 5,
                              child: Items[i]["discount"] != 0 ?
                              Row(
                                children: [
                                  Text(" AED ",style: TextStyle( fontWeight: FontWeight.w500,color: AppColor.darkMintColor),),
                                  Container(
                                    child: Text(Items[i]["discount_price"].toString()),
                                  ),

                                  Container(
                                    child: Text(
                                        Items[i]["price"].toString(),
                                      style: TextStyle(decoration: TextDecoration.lineThrough,decorationThickness: 2.0,decorationColor: AppColor.primaryColor),
                                    ),
                                  ),
                                ],
                              )  :
                              Row(
                                children: [
                                  Text(" AED ",style: TextStyle(fontWeight: FontWeight.w500,color: AppColor.darkMintColor),),
                                  Container(
                                    child: Text(Items[i]["price"].toString()),
                                  ),
                                ],
                              )
                          )
                        ],
                      ),
                    ],
                  ),
                  i == 1 ? Positioned(
                      top: 102,
                      right: 10,
                      child: Container(
                        height: 35,
                        padding: EdgeInsets.only(top: 10,left: 10,right: 10),
                        decoration: BoxDecoration(
                            color: AppColor.secondColor,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Text("Fastest selling".tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontFamily: "sans"),),
                      )
                  ) :
                  const Text('')
                ],
              ),
            ),
          ),
        ),
      );

  }
}
