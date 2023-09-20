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
import '../../../controller/favorite_controller.dart';
import '../../widget/customappbar.dart';


class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemControllerImp controller = Get.put(ItemControllerImp());

    return
      Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child:
        ListView(
                children: [
                  CustomAppBar(
                    myController: controller.search!,
                    onChanged: (val){
                      controller.checkSearch(val);
                    },
                    titlehinttext: "search",
                    // onPressedIcon: (){},
                    onPressedSearch: (){},
                    onPressedIconFavorite: (){
                      Get.toNamed(AppRoute.favoritesItems);
                    },
                  ),
                  const ListCategoriesItems(),
                  GetBuilder<ItemControllerImp>(builder: (controllerImp)=>
                    HandlingDataView(
                    statusRequest: controllerImp.statusRequest,
                    widget:
                        controller.isSearch == false ?
                    ItemsCustomListItems(Items: controllerImp.items)
                      :
                        ListItemsSearch(ItemsSearch: controller.searchItems,searchResolute: controller.searchResolute!,)
                      ,
                  )
                  )
                ],
              ),
          )


    );
  }
}
