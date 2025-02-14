import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/favoriteitems_controller.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:handmade/core/functions/DBtranslation.dart';
import 'package:handmade/core/functions/handlingdatacontroller.dart';
import 'package:handmade/view/screen/search/listitemsearch.dart';
import 'package:handmade/view/widget/items/customfavoriteitems.dart';
import 'package:handmade/view/widget/items/customlistitems.dart';
import 'package:shimmer/shimmer.dart';
import '../widget/customappbar.dart';

class FavoriteItems extends StatelessWidget {
  const FavoriteItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteItemsController());
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(vertical:25,horizontal: 15),

          child: GetBuilder<FavoriteItemsController>(
          builder: ((controller) =>
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white12,
                  flexibleSpace: CustomAppBar(
                    myController: controller.search!,
                    onChanged: (val){
                      controller.checkSearch(val);
                    },
                    titlehinttext: "Search".tr,
                    onPressedSearch: (){},
                    onPressedIconFavorite: (){
                      Get.toNamed(AppRoute.favoritesItems);
                    },
                  ),
                ),
                SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        GetBuilder<FavoriteItemsController>(builder: (controllerImp)=>
                            HandlingDataView(
                              loadingWidget: Shimmer.fromColors(
                                baseColor: Colors.grey,
                                highlightColor: Colors.white10,
                                child:Text('ss'),
                              ),
                              statusRequest: controllerImp.statusRequest,
                              widget:
                              controllerImp.isSearch == false ?
                              CustomFavoriteItems(Items: controllerImp.items)
                                  :
                              ListItemsSearch(ItemsSearch: controller.searchItems,searchResolute: controller.searchResolute!,)
                              ,
                            )
                        )
                      ]
                    )
                )
              ],
            )

          ),
        )
      ),
    );
  }
}
