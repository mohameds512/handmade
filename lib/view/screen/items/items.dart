import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/items_controller.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/view/screen/search/listitemsearch.dart';
import 'package:handmade/view/widget/items/customlistitems.dart';
import 'package:handmade/view/widget/items/listcategoriesitems.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../widget/customappbar.dart';


class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemControllerImp controller = Get.put(ItemControllerImp());

    return
      Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical:25,horizontal: 15),

        child:
        CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              automaticallyImplyLeading: false,
              backgroundColor: AppColor.whiteColor,
              flexibleSpace: CustomAppBar(
                myController: controller.search!,
                onChanged: (val){
                  controller.checkSearch(val);
                },
                titlehinttext: "search".tr,
                onPressedSearch: (){},
                onPressedIconFavorite: (){
                  Get.toNamed(AppRoute.favoritesItems);
                },
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const ListCategoriesItems(),
                  GetBuilder<ItemControllerImp>(builder: (controllerImp)=>
                      HandlingDataView(
                        loadingWidget: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white10,
                          child:Text('ss'),
                        ),
                        statusRequest: controllerImp.statusRequest,
                        widget:
                        controller.isSearch == false ?
                        ItemsCustomListItems(Items: controllerImp.items)
                            :
                        ListItemsSearch(ItemsSearch: controller.searchItems,searchResolute: controller.searchResolute!,)
                        ,
                      )
                  )
                ]
              ),
            )
          ],
        ),
        // ListView(
        //         children: [
        //           CustomAppBar(
        //             myController: controller.search!,
        //             onChanged: (val){
        //               controller.checkSearch(val);
        //             },
        //             titlehinttext: "search",
        //             // onPressedIcon: (){},
        //             onPressedSearch: (){},
        //             onPressedIconFavorite: (){
        //               Get.toNamed(AppRoute.favoritesItems);
        //             },
        //           ),
        //           const ListCategoriesItems(),
        //           GetBuilder<ItemControllerImp>(builder: (controllerImp)=>
        //             HandlingDataView(
        //             statusRequest: controllerImp.statusRequest,
        //             widget:
        //                 controller.isSearch == false ?
        //             ItemsCustomListItems(Items: controllerImp.items)
        //               :
        //                 ListItemsSearch(ItemsSearch: controller.searchItems,searchResolute: controller.searchResolute!,)
        //               ,
        //           )
        //           )
        //         ],
        //       ),
          )


    );
  }
}
