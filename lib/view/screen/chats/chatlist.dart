import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:handmade/controller/chat/chat_controller.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/chat/conversation_controller.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:shimmer/shimmer.dart';
class AppChatList extends GetView<ConversationController> {
  const AppChatList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConversationController controller = Get.put(ConversationController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
      ),
      body: GetBuilder<ConversationController>(builder: (controller) =>
        HandlingDataView(
          statusRequest: controller.statusRequest,
          loadingWidget: Shimmer.fromColors(
              baseColor: Colors.grey,
              highlightColor: Colors.white10,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context,index){
                    return Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            border: Border(bottom:BorderSide(color: Colors.grey ,width: 0.4) )
                        ),
                        child:InkWell(
                          onTap: (){
                            Get.toNamed(AppRoute.Chats);
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CachedNetworkImage(
                                  imageUrl: 'https://antika.dnsmsaeed.net/api/items/image/items/kSLVV1/3HCl',
                                  height: 60,

                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 20,left: 10),
                                child: Text("data"),
                              )

                            ],
                          ),
                        )
                    );
                  }
              ),
          ),
          widget:
          Container(
              padding: EdgeInsets.all(10),
              child:ListView.builder(
                  itemCount: controller.listConversation.length,
                  itemBuilder: (context,index){
                    return Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            border: Border(bottom:BorderSide(color: Colors.grey ,width: 0.4) )
                        ),
                        child:InkWell(
                          onTap: (){
                            Get.toNamed(AppRoute.Chats , arguments:{ 'conver_id':controller.listConversation[index]['id'] } ,);
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: CachedNetworkImage(
                                  imageUrl: 'https://antika.dnsmsaeed.net/api/items/image/items/kSLVV1/3HCl',
                                  height: 60,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 20,left: 10),
                                child: Text("data"),
                              )

                            ],
                          ),
                        )
                    );
                  }
              )
          ),
        )
      )




    );
  }
}
