import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:handmade/controller/chat/chat_controller.dart';
import 'package:handmade/view/widget/chat/customtextinput.dart';
import 'package:handmade/view/widget/chat/message_bubble.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class AppChat extends StatelessWidget {
  const AppChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatController controller = Get.put(ChatController());
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      controller.scrollController.jumpTo(controller.scrollController.position.maxScrollExtent);
    });
    return
      Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              GetBuilder<ChatController>(
                  builder: (controller){
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(controller.receiver_name),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            imageUrl: 'https://antika.dnsmsaeed.net/api/items/image/items/kSLVV1/3HCl',
                            height: 42,
                          ),
                        ),
                      ],
                    );
                  }
              )

            ],
          ),
        ),
        bottomNavigationBar: CustomInputMessage(
            myController: controller.message ,
            onPressedSend: (){
              controller.sendMessage();
            },
          onPressedFile: ()async{
              var file = await ImagePicker().pickImage(source: ImageSource.gallery);
          },
        ),
        body: GetBuilder<ChatController>(
          builder: (controller) {
            WidgetsBinding.instance?.addPostFrameCallback((_) {
              controller.scrollController.jumpTo(controller.scrollController.position.maxScrollExtent);
            });

            return Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets?.bottom != null
                    ? MediaQuery.of(context).size.height - MediaQuery.of(context).size.height + 10
                    : 2,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      padding: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: ListView.separated(
                        controller: controller.scrollController,
                        itemBuilder: (context, index) => MessageBubble(
                          message: controller.ChatList[index],
                          User_id: controller.user_id,
                        ),
                        separatorBuilder: (context, index) => SizedBox(height: 8),
                        itemCount: controller.ChatList.length,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
  }
}

