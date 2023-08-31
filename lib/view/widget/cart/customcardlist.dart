import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:handmade/core/constant/ImageAssets.dart';

class CustomCardList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imgLink;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomCardList({Key? key, required this.name, required this.price, required this.count, required this.imgLink,required this.onAdd,required this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(child: Row(children: [
        Expanded(
            flex:2,
            child: CachedNetworkImage(imageUrl: imgLink,fit: BoxFit.cover,)
        ),

        Expanded(
            flex: 3,
            child: ListTile(
              title:Text(name),
              subtitle: Text(price,style: const TextStyle(color: Colors.red,fontSize: 18,fontFamily: "sans"),),
            )
        ),
        Expanded(child: Column(
          children: [
            Container(
              // height:30,
                child: IconButton(onPressed: onAdd, icon: Icon(Icons.add))
            ),
            Container(
              // height: 30,
              child: Text(count,style: TextStyle(fontFamily: "sans"),),
            ),
            Container(
                height: 30,
                child: IconButton(onPressed: onRemove, icon: Icon(Icons.remove))
            ),
          ],
        )),
      ],),),
    );
  }
}
