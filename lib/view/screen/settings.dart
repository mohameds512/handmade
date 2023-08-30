import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/settings/settings_controller.dart';
import 'package:handmade/core/constant/ImageAssets.dart';
import 'package:handmade/core/constant/color.dart';
class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsControllerImp controllerImp = Get.put(SettingsControllerImp());
    return Container(
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

                  trailing: Switch(onChanged: (val){},value: true,),
                  title: Text("Disable  Notification"),
                ),
                Divider(),
                ListTile(
                  onTap: (){

                  },
                  trailing: Icon(Icons.location_on_outlined),
                  title: Text("Address"),
                ),
                Divider(),
                ListTile(
                  onTap: (){

                  },
                  trailing: Icon(Icons.help_outline),
                  title: Text("About us"),
                ),
                Divider(),
                ListTile(
                  onTap: (){

                  },
                  trailing: Icon(Icons.contact_mail_outlined),
                  title: Text("Contact us"),
                ),
                Divider(),
                ListTile(
                  onTap: (){
                    controllerImp.LogOut();
                  },
                  title: Text("Logout"),
                  trailing: Icon(Icons.exit_to_app),
                )
              ],
            ),),
          )

        ],
      ),
    );
  }
}
