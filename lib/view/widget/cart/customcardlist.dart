import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:handmade/core/constant/ImageAssets.dart';
import 'package:handmade/core/constant/color.dart';

class CustomCardList extends StatelessWidget {
  final String name;
  final String price;
  final int status;
  final List Item_info;
  final String count;
  final String imgLink;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomCardList({Key? key, required this.name, required this.price, required this.count, required this.imgLink,required this.onAdd,required this.onRemove, required this.status, required this.Item_info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children:
        [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CachedNetworkImage(
                  imageUrl: imgLink,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 3,
                child: SizedBox(
                  height: 200, // Set the desired fixed height for the column
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(name),
                        subtitle: Text(
                          price,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontFamily: "sans",
                          ),
                        ),
                      ),
                      Item_info.length > 0 ?
                      Expanded(
                        child:
                        GridView.builder(
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                          ),
                          itemCount: Item_info.length,
                          itemBuilder: (context, index) => ConstrainedBox(
                            constraints: BoxConstraints.tightFor(height: 10), // Set the desired fixed height for the container
                            child: Container(
                              margin: EdgeInsets.all(10),
                              // padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                // color: Colors.red
                              ),
                              child: Row(
                                children: [
                                  Text(Item_info[index]['name'] + " : ",style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                                  Text(Item_info[index]['value'] )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ) : Text(""),
                    ],
                  ),
                ),
              ),
            ],
          ),
          status == 0 ?
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(onPressed: onRemove, icon: Icon(Icons.delete_outlined,color: AppColor.redColor,))
          ) : Text(''),

        ]
        ),

    );
  }
}
