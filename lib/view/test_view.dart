import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/test_controller.dart';
import 'package:handmade/core/class/statusrequest.dart';
class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return  Scaffold(
      appBar: AppBar(
        title: const Text('test'),
      ),
      body: GetBuilder<TestController>(builder: (controller){
          if(controller.statusRequest == StatusRequest.loading){
              return const Center(child: Text("loading"),);
          }else if(controller.statusRequest == StatusRequest.offlinefailure){
            return const Center(child: Text("offlinefailure"),);
          }else if(controller.statusRequest == StatusRequest.serverfailure){
            return const Center(child: Text("serverfailure"),);
          }else{
            return ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context,index){
                return Text("${controller.data}");
            });
          }
        },
      ),
    );
  }
}
