import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:handmade/core/functions/DBtranslation.dart';
import 'package:handmade/data/model/itemsModel.dart';

import '../../../core/constant/color.dart';

class ItemsCustomListItems extends StatelessWidget {
  // final ItemsModel itemsModel;
  final List Items;
  const ItemsCustomListItems({Key? key, required this.Items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount:Items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.9),
        itemBuilder: (BuildContext context,index){
          return InkWell(

            child: Card(

              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                        imageUrl: Items[index]["img_route"]!,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(height: 10,),
                    Text(TransDB(Items[index]["name"]!) ,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Rating 3.4",textAlign: TextAlign.left,style: TextStyle(fontSize: 12),),
                        Row(
                          children: [
                            ...List.generate(5, (index) => Icon(Icons.star,size: 10,))
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${Items[index]["price"]} \$",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: "sans",color: AppColor.primaryColor)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: AppColor.primaryColor,))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
}
