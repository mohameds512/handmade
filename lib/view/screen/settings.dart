import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/settings/settings_controller.dart';
import 'package:handmade/core/constant/ImageAssets.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/constant/routes.dart';
class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controllerImp = Get.put(SettingsControllerImp());

    return GetBuilder<SettingsControllerImp>(builder: (controller) =>
        Container(
          child: ListView(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(height: Get.width/3,color: AppColor.primaryColor,),
                  Positioned(top: Get.width/4 , child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(100)),
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage(AppImageAssets.logo),
                    ),
                  )
                  ),
                ],),
              SizedBox(height: 100,),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Card(child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      onTap: () {

                      },
                      trailing: Switch(onChanged: (val){
                        controllerImp.muteNotification();

                      },value: controller.switchValue!,),
                      title: Text("Disable Notification".tr),
                    ),
                    Divider(),
                    ListTile(
                      onTap: (){
                        Get.toNamed(AppRoute.pendingOrder);
                      },
                      trailing: Icon(Icons.countertops_outlined),
                      title: Text("Orders".tr),
                    ),
                    Divider(),
                    ListTile(
                      onTap: (){
                        Get.toNamed(AppRoute.archivedOrder);
                      },
                      trailing: Icon(Icons.location_on_outlined),
                      title: Text("Archive".tr),
                    ),
                    Divider(),
                    ListTile(
                      onTap: (){
                        Get.toNamed(AppRoute.AddressView);
                      },
                      trailing: Icon(CupertinoIcons.building_2_fill),
                      title: Text("Address".tr),
                    ),
                    Divider(),
                    ListTile(
                      onTap: (){

                      },
                      trailing: Icon(Icons.help_outline),
                      title: Text("About us".tr),
                    ),
                    Divider(),
                    ListTile(
                      onTap: (){
                        Get.toNamed(AppRoute.contactUs);
                      },
                      trailing: Icon(Icons.contact_mail_outlined),
                      title: Text("Contact us".tr),
                    ),
                    Divider(),
                    ListTile(
                      onTap: (){
                        controllerImp.LogOut();
                      },
                      title: Text("Logout".tr),
                      trailing: Icon(Icons.exit_to_app),
                    )
                  ],
                ),),
              )

            ],
          ),
        )
      ,);

  }
}
