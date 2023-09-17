import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/offer/offer_controller.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/view/screen/search/listitemsearch.dart';
import 'package:handmade/view/widget/customappbar.dart';
import 'package:handmade/view/widget/offers/customlistitemsoffer.dart';
class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OfferController controller = Get.put(OfferController());
    return GetBuilder<OfferController>(builder: (controller) =>
        Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            // physics: NeverScrollableScrollPhysics(),

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
                // Get.toNamed(AppRoute.favoritesItems);
              },
            ),
            SizedBox(height:10 ,),
            controller.isSearch == false ?
            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget:ItemsCustomListItemsOffer(Items: controller.items,)
            ) :
            ListItemsSearch(ItemsSearch: controller.searchItems,searchResolute: controller.searchResolute!,)
          ],),
        )
      ,);
  }
}
