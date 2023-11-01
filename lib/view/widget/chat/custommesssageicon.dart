import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/chat/chat_controller.dart';
import 'package:handmade/controller/home_controller.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/constant/routes.dart';

class CustomMessageIcon extends StatelessWidget {
  const CustomMessageIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ChatController controller = Get.put(ChatController());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => InkWell(
          onTap: (){
            Get.toNamed(AppRoute.ChatList);
          },
          child: Stack(

            children: [
              Container(
                padding: EdgeInsets.only(right: 14),
                child: IconButton(
                  onPressed: (){
                    Get.toNamed(AppRoute.ChatList);
                  },

                  icon: const Icon(
                    Icons.chat_outlined,color: AppColor.primaryColor,size: 34,),
                  iconSize: 20 ,color: Colors.grey[600],
                ),
              ),
              controller.unseenCount != '0' ?
                    Positioned(
                      left: 25,
                      top: 0,
                      child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal:int.parse(controller.unseenCount) > 9 ? 6 : 10,
                        vertical: 5
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red
                    ),
                    // child: Text('1'),
                    child: Text( int.parse(controller.unseenCount) > 99 ? '99+' : controller.unseenCount ),
                  )
              )
                  : Text(" "),
            ],
          ),
        )
    );

  }
}
