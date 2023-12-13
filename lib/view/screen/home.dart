import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/core/functions/DBtranslation.dart';
import 'package:handmade/view/screen/search/listitemsearch.dart';
import 'package:handmade/view/widget/customappbar.dart';
import 'package:handmade/view/widget/home/customcardhome.dart';
import 'package:handmade/view/widget/home/customlistcategory.dart';
import 'package:handmade/view/widget/home/customlistitem.dart';
import 'package:handmade/view/widget/home/customtitlehome.dart';
import 'package:handmade/view/widget/items/customnearsetitems.dart';
import 'package:shimmer/shimmer.dart';
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    HomeControllerImp controllerImp = Get.put(HomeControllerImp());
    return  GetBuilder<HomeControllerImp>(builder: (controller)=>

        Scaffold(
          body: Container(
              padding: const EdgeInsets.symmetric(vertical:25,horizontal: 3),

              child:
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    floating: false,
                    automaticallyImplyLeading: false,
                    backgroundColor: AppColor.mintColor,
                    flexibleSpace: CustomAppBar(
                      myController: controller.search!,
                      onChanged: (val) {
                        controller.checkSearch(val);
                        },
                      titlehinttext: "search".tr,
                      // onPressedIcon: (){},
                      onPressedSearch: () {},
                      onPressedIconFavorite: () {
                        Get.toNamed(AppRoute.favoritesItems);
                      },
                    ),
                  ),
                  SliverList(

                    delegate: SliverChildListDelegate(
                      [
                        HandlingDataView(
                          loadingWidget: Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.white10,
                            child:Text('ss'),
                          ),
                          statusRequest: controller.statusRequest!,
                          widget: controller.isSearch == false
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (controller.SettingData.isNotEmpty)
                                CustomCardHome(
                                    titletext: TransDB(controller.SettingData?["name"]),
                                    bodytext: TransDB(controller.SettingData?["body"])),
                              CustomTitleHome(texttitle: "Categories".tr),
                              CustomListCategory(
                                Categories: controller.categories,
                              ),
                              CustomTitleHome(texttitle: "Nearest".tr),
                              CustomNearestItems(Items: controller.Nearest,Lang: controller.Lang),
                              CustomTitleHome(texttitle: "Top Selling".tr),
                              CustomListItem(Items: controller.top_sealing_items),
                              CustomTitleHome(texttitle: "All Products".tr),
                              CustomListItem(Items: controller.items),
                            ],
                          )
                              : ListItemsSearch(
                            ItemsSearch: controller.searchItems,
                            searchResolute: controller.searchResolute!,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )


          ),
        ),


    );


  }
}




