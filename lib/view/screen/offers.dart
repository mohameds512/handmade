import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/offer/offer_controller.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/view/screen/search/listitemsearch.dart';
import 'package:handmade/view/widget/customappbar.dart';
import 'package:handmade/view/widget/offers/customlistitemsoffer.dart';
import 'package:shimmer/shimmer.dart';
class Offers extends StatelessWidget {
  const Offers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OfferController controller = Get.put(OfferController());
    return GetBuilder<OfferController>(builder: (controller) =>
        Container(
            padding: const EdgeInsets.symmetric(vertical:25,horizontal: 15),

            child:
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
                  titlehinttext: "search".tr,
                  // onPressedIcon: (){},
                  onPressedSearch: (){},
                  onPressedIconFavorite: (){
                    // Get.toNamed(AppRoute.favoritesItems);
                  },
                ),
              ),
              SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      controller.isSearch == false ?
                      HandlingDataView(
                          loadingWidget: Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.white10,
                            child:Text('ss'),
                          ),
                          statusRequest: controller.statusRequest,
                          widget:ItemsCustomListItemsOffer(Items: controller.items,)
                      ) :
                      ListItemsSearch(ItemsSearch: controller.searchItems,searchResolute: controller.searchResolute!,)
                    ]
                  )
              )
            ],
          )
        )
      ,);
  }
}
