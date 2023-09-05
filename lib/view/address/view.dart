import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/address/view_controller.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/view/widget/address/cardviewaddress.dart';
class addressView extends StatelessWidget {
  const addressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewAddressController controller = Get.put(ViewAddressController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Address"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Get.toNamed(AppRoute.AddressAdd);
        },
        child: Icon(Icons.add),
      ),
      body:GetBuilder<ViewAddressController>(builder: (controller)=>
        HandlingDataView(statusRequest: controller.statusRequest,
            widget: Container(
              child: ListView.builder(
                  itemCount: controller.addresses.length,
                  itemBuilder: (context , index){
                    return  CardViewAddress(
                        address: controller.addresses[index],
                        onPressedDelete: (){
                          controller.deleteAddress(controller.addresses[index]["id"]);
                        },
                    );
                  },

              )
            )
        )  ,
      )
    );
  }
}



