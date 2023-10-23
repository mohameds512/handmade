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
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: Items.length,
          itemBuilder: (context, i) => InkWell(
            onTap: () {
              controller.goToProductDetails(Items[i]);
            },
            child: Column(
              children: [
                Container(
                  // padding: EdgeInsets.all(50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(Items[i]["img_route"]),
                    ),
                  ),
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                ),
                Text(
                  TransDB(Items[i]["name"] ?? ''),
                  style: TextStyle(color: AppColor.shadowPrimaryColor, fontSize: 13,),
                ),
              ],
            ),
          ),
        ),
      );
    //   SizedBox(
    //   height: 120,
    //   child: ListView.builder(
    //       itemCount: Items.length,
    //       scrollDirection: Axis.horizontal,
    //       itemBuilder: (context , i){
    //         return InkWell(
    //           onTap: (){
    //             controller.goToProductDetails(Items[i]);
    //           },
    //           child: Column(
    //             children: [
    //               Container(
    //                 margin: EdgeInsets.symmetric(horizontal: 10),
    //                 decoration: BoxDecoration(
    //                     // shape: BoxShape.circle,
    //                     borderRadius: BorderRadius.circular(5),
    //                     image: DecorationImage(
    //                       fit: BoxFit.fill,
    //                       image: CachedNetworkImageProvider(Items[i]["img_route"]),
    //                     )
    //                 ),
    //                 height: 100,
    //                 width: 100,
    //
    //               ),
    //               Text(TransDB(Items[i]["name"]?? ''),style: TextStyle(color: AppColor.black,fontSize: 13),)
    //             ],
    //
    //           ),
    //
    //         )
    //          ;
    //       }
    //   ),
    // );
  }
}
