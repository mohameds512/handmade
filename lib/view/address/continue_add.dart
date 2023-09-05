import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handmade/controller/address/add_controller.dart';
import 'package:get/get.dart';
import 'package:handmade/controller/address/continue_add_controller.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/functions/validinput.dart';
import 'package:handmade/view/widget/auth/custombuttonauth.dart';
import 'package:handmade/view/widget/auth/customtextformauth.dart';

class addressAddContinue extends StatelessWidget {
  const addressAddContinue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContinueAddressAddController controllerMap = Get.put(ContinueAddressAddController());
    return Scaffold(
        appBar: AppBar(
          title: Text("Add address details"),
        ),
        body: Container(
            padding: EdgeInsets.all(15),
            child: GetBuilder<ContinueAddressAddController>(
              builder: (controllerMap)=>
                  HandlingDataView(statusRequest: controllerMap.statusRequest,
                    widget:Form(
                      key:controllerMap.formstate ,
                      child: ListView(
                        children: [
                          CustomTextFormAuth(
                              hinttext: "address name",
                              labeltext: "Address Name",
                              iconData: Icons.near_me,
                              myController: controllerMap.name,
                              valid: (val){
                                return validInput(val!, 3,100, "name");
                              },
                              isNumber: false
                          ),
                          CustomTextFormAuth(
                              hinttext: "address city",
                              labeltext: "Address City",
                              iconData: Icons.location_city,
                              myController: controllerMap.city,
                              valid: (val){
                                return validInput(val!, 3,100, "city");
                              },
                              isNumber: false
                          ),
                          CustomTextFormAuth(
                              hinttext: "address street",
                              labeltext: "Address Street",
                              iconData: Icons.location_searching_sharp,
                              myController: controllerMap.street,
                              valid: (val){
                                return validInput(val!, 3,100, "street");
                              },
                              isNumber: false
                          ),
                          CustomButtonAuth(
                            text: "Add",
                            onPressed: (){
                              controllerMap.AddAddress();
                            },
                          )
                        ],
                      ),
                    )

                  )
          )

          )


    );
  }
}
