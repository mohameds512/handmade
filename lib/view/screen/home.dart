import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/homescreen_controller.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/core/functions/DBtranslation.dart';
import 'package:handmade/view/screen/items/items.dart';
import 'package:handmade/view/screen/search/listitemsearch.dart';
import 'package:handmade/view/widget/customappbar.dart';
import 'package:handmade/view/widget/home/customcardhome.dart';
import 'package:handmade/view/widget/home/customlistcategory.dart';
import 'package:handmade/view/widget/home/customlistitem.dart';
import 'package:handmade/view/widget/home/customtitlehome.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
              padding: const EdgeInsets.symmetric(vertical:25,horizontal: 15),

              child:
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    floating: false,

                    backgroundColor: AppColor.whiteColor,
                    flexibleSpace: CustomAppBar(
                      myController: controller.search!,
                      onChanged: (val) {
                        controller.checkSearch(val);
                      },
                      titlehinttext: "search",
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
                          statusRequest: controller.statusRequest!,
                          widget: controller.isSearch == false
                              ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (controller.SettingData.isNotEmpty)
                                CustomCardHome(
                                    titletext: TransDB(controller.SettingData?["name"]),
                                    bodytext: TransDB(controller.SettingData?["body"])),
                              const CustomTitleHome(texttitle: "Categories"),
                              CustomListCategory(
                                Categories: controller.categories,
                              ),

                              const CustomTitleHome(texttitle: "Top Selling"),
                              CustomListItem(Items: controller.top_sealing_items),
                              const CustomTitleHome(texttitle: "All Products"),
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




