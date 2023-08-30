import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/view/widget/customappbar.dart';
import 'package:handmade/view/widget/home/customcardhome.dart';
import 'package:handmade/view/widget/home/customlistcategory.dart';
import 'package:handmade/view/widget/home/customlistitem.dart';
import 'package:handmade/view/widget/home/customtitlehome.dart';
import 'package:image_picker/image_picker.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(HomeControllerImp());
    return  GetBuilder<HomeControllerImp>(builder: (controller)=>
          HandlingDataView(
              statusRequest: controller.statusRequest!,
              widget:
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 15),

                  child:  ListView(
                    children: [
                      CustomAppBar(
                          titlehinttext: "search",
                        // onPressedIcon: (){},
                        onPressedSearch: (){},
                        onPressedIconFavorite: (){
                            Get.toNamed(AppRoute.favoritesItems);
                        },
                      ),
                      const CustomCardHome(titletext: "Month Offer", bodytext: "CashBack 5%"),
                      CustomListCategory(
                        Categories: controller.categories,
                      ),
                      const SizedBox(height: 10,),
                      const CustomTitleHome(texttitle: "Offers"),
                      CustomListItem(Items: controller.items),
                      const CustomTitleHome(texttitle: "All Products"),
                      CustomListItem(Items: controller.items),
                    ],
                  )
              ),
          )
      );


  }
}
