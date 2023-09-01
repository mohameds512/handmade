
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/home_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:handmade/core/functions/DBtranslation.dart';

class ListItemsSearch extends GetView<HomeControllerImp> {
  final List ItemsSearch;
  final bool searchResolute;
  const ListItemsSearch({Key? key, required this.ItemsSearch , required this.searchResolute}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      searchResolute ?

      ListView.builder(
          itemCount: ItemsSearch.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            return  InkWell(
              onTap: (){
                controller.goToProductDetails(ItemsSearch[index]);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                child: Card(child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(child:CachedNetworkImage(imageUrl: ItemsSearch[index]["img_route"],height: 90,) ),
                      Expanded(
                        flex: 2,
                        child: ListTile(
                          title: Text(TransDB(ItemsSearch[index]["name"])),
                          subtitle: Text(TransDB(ItemsSearch[index]["desc"]),maxLines: 2),
                        ),
                      )
                    ],
                  ),
                ),),
              ),
            );
          }
      ) :
      const Center(child: Text("No Matching Data"),) ;
  }
}