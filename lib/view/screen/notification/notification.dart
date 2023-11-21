import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/notification/notification_controller.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:shimmer/shimmer.dart';
class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NotificationController controller = Get.put(NotificationController());
    return Scaffold(
      appBar: AppBar(title: Text("Notifications".tr)),
      body: Container(
        padding: EdgeInsets.all(10),
        child: GetBuilder<NotificationController>(builder: (controller)=>
          HandlingDataView(
              loadingWidget: Shimmer.fromColors(
                baseColor: Colors.grey,
                highlightColor: Colors.white10,
                child:Text('ss'),
              ),
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  ...List.generate(
                      controller.Notfs.length,
                          (index) => Container(
                            child: Stack(
                              children: [
                                ListTile(
                                  title: Text(controller.Notfs[index]["title"]),
                                  subtitle: Text(controller.Notfs[index]["body"]),

                                ),
                                Positioned(
                                  top: 15,
                                  right: controller.curr_lang != 'ar' ? 5 : null,
                                  left: controller.curr_lang == 'ar' ? 5 : null,
                                    child: Text(controller.Notfs[index]["added_ago"],style: TextStyle(fontFamily: "sans",color: AppColor.primaryColor),)
                                )
                              ],
                            )
                          )
                  )
                ],
              )
          )
        ,
        )

      ),
    );
  }
}
