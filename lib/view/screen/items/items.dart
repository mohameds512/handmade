import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/items_controller.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/view/widget/items/customlistitems.dart';
import 'package:handmade/view/widget/items/listcategoriesitems.dart';
import 'package:get/get.dart';
import '../../../controller/favorite_controller.dart';
import '../../widget/customappbar.dart';


class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ItemControllerImp());

    return
      Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
                children: [
                  CustomAppBar(
                    titlehinttext: "search",
                    // onPressedIcon: (){},
                    onPressedSearch: (){},
                  ),
                  const ListCategoriesItems(),
                  GetBuilder<ItemControllerImp>(builder: (controllerImp)=>
                    HandlingDataView(
                    statusRequest: controllerImp.statusRequest,
                    widget:ItemsCustomListItems(Items: controllerImp.items),
                  )
                  )
                ],
              ),
          )


    );
  }
}
