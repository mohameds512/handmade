import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:handmade/controller/favorite_controller.dart';
import 'package:handmade/controller/items_controller.dart';
import 'package:handmade/controller/offer/offer_controller.dart';
import 'package:handmade/core/constant/ImageAssets.dart';
import 'package:handmade/core/functions/DBtranslation.dart';
import 'package:handmade/data/model/itemsModel.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
class ItemsCustomListItemsOffer extends GetView<OfferController> {
  // final ItemsModel itemsModel;
  final List Items;
  const ItemsCustomListItemsOffer({Key? key, required this.Items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FavoriteController favController = Get.put(FavoriteController());
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount:Items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.8),
        itemBuilder: (BuildContext context,index){
          return InkWell(
            onTap: (){
              controller.goToProductDetails(Items[index]);
            },
            child: Card(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Hero(
                          tag: Items[index]["id"]!,
                          child: CachedNetworkImage(
                            imageUrl: Items[index]["img_route"]!,
                            height: 100,
                            fit: BoxFit.fill,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(TransDB(Items[index]["name"]!) ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text("Rating 3.4",textAlign: TextAlign.left,style: TextStyle(fontSize: 12),),
                        //     Row(
                        //       children: [
                        //         ...List.generate(5, (index) => Icon(Icons.star,size: 10,))
                        //       ],
                        //     )
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${Items[index]["discount_price"]} \$",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "sans",color: AppColor.primaryColor)),
                            Text("${Items[index]["price"]} \$",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "sans",decorationColor: AppColor.primaryColor, decorationThickness: 2.0,decoration: TextDecoration.lineThrough)),
                            IconButton(
                                onPressed: (){
                                  if(controller.checkFavorite(Items[index]["id"])  == '1'){
                                    controller.setFavorite(Items[index]["id"], '0');
                                  }else{
                                    controller.setFavorite(Items[index]["id"], '1');
                                  }
                                },
                                icon: controller.checkFavorite(Items[index]["id"])  == '1' ?
                                Icon(Icons.favorite,color: AppColor.primaryColor,)
                                    :  Icon(Icons.favorite_border,color: AppColor.primaryColor,))
                          ],
                        ),
                      ],
                    ),
                  ),
                  if(Items[index]["discount"] != 0) Positioned(
                      top: 4,
                      left: 4,
                      child: Image.asset(AppImageAssets.sale1,height: 40,)
                  )
                ],
              ),
            ),
          );
        }
    );
  }
}
