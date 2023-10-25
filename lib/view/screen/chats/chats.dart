import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:handmade/controller/chat/chat_controller.dart';
import 'package:handmade/view/widget/chat/customtextinput.dart';
import 'package:handmade/view/widget/chat/message_bubble.dart';
import 'package:get/get.dart';

class AppChat extends StatelessWidget {
  const AppChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatController controller = Get.put(ChatController());

    return
      Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Text("User Name"),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      imageUrl: 'https://antika.dnsmsaeed.net/api/items/image/items/kSLVV1/3HCl',
                      height: 42,

                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        bottomNavigationBar: CustomInputMessage(
            myController: controller.message ,
            onPressedSend: (){
              controller.sendMessage();
              print("ssssssssssssssssssssssss");
              print(controller.message.text);
            }
        ),
        body:GetBuilder<ChatController>(builder: (controller) =>Column(
          children: [
            Expanded(
                child: Container(
                  height: double.infinity,
                  padding: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)
                      )
                  ),
                  child: ListView.separated(
                      itemBuilder: (context,index) => MessageBubble(message: controller.ChatList[index],User_id: controller.user_id),
                      separatorBuilder: (context,index) =>SizedBox(height: 8,) ,
                      itemCount: controller.ChatList.length
                  ),
                )
            ),
            // CustomInputMessage(
            //     myController: controller.message ,
            //     onPressedSend: (){
            //       print("ssssssssssssssssssssssss");
            //       print(controller.message.text);
            //     }
            // )
          ],
        ),

        )
      );
  }
}



