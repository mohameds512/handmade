import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:handmade/core/class/handlingdata.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     Get.put(HomeControllerImp());
    return Scaffold(

      body: GetBuilder<HomeControllerImp>(builder: (controller)=>
          HandlingDataView(
              statusRequest: controller.statusRequest!,
              widget:
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 15),

                  child:  ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(children: [
                          Expanded(child: TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                hintText: "search",
                                hintStyle: const TextStyle(fontSize: 18),

                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(20)
                                ),
                                filled: true,
                                fillColor: AppColor.backgroundColor
                            ),
                          )),
                          const SizedBox(width:15),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColor.backgroundColor,
                                borderRadius: BorderRadius.circular(10)
                            ),

                            child: IconButton(
                              onPressed: (){},
                              icon: const Icon(
                                  Icons.notifications_active_outlined),
                              iconSize: 30 ,color: Colors.grey[600],
                            ),
                          ),

                        ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Stack(children: [
                          Container(
                            alignment: Alignment.center,
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red,
                            ),
                            child: const ListTile(
                              title: Text("test text",style: TextStyle(color: Colors.white,fontSize: 20)),
                              subtitle: Text("test text test text test text test text",style: TextStyle(color: Colors.white,fontSize: 40)),
                            ),
                          ),
                          Positioned(
                            top: -30,
                            right: -30,
                            child: Container(
                              height: 170,
                              width: 170,
                              decoration: BoxDecoration(
                                  color: AppColor.shadowPrimaryColor,
                                  borderRadius: BorderRadius.circular(170)
                              ),
                            ),
                          )
                        ],
                        ),
                      ),
                      Container(
                        height: 100,
                        child: ListView.separated(

                          separatorBuilder: (context,index)=>const SizedBox(width: 15,),
                          itemCount: controller.categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context , index){
                              return Column(
                                children: [
                                    Container(
                                    decoration: BoxDecoration(
                                    color: AppColor.secondColor,
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    padding: const EdgeInsets.symmetric(horizontal: 15),
                                    height: 70,
                                    width: 70,
                                    child:
                                    Image.network(controller.categories[index]["img_route"],color: AppColor.shadowPrimaryColor),

                                    ),
                                  Text(controller.categories[index]["name"],style: TextStyle(color: AppColor.black,fontSize: 13),)
                                ],
                                
                              );
                            },
                        )
                      ),
                      const SizedBox(height: 10,),
                      const Text("Products",style: TextStyle(fontSize: 20,color: AppColor.primaryColor,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          itemCount: controller.items.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context , i){
                              return Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                    child: Image.network(controller.items[i]['img_route'],width: 120,height: 90,)
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: AppColor.secondColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    height: 100,
                                    width: 140,

                                  ),
                                  Positioned(
                                    left:5,
                                      top:5,
                                      child:
                                      Text(
                                        controller.items[i]["name"],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),)
                                  )
                                ],
                              );
                            }
                        ),
                      )
                    ],
                  )
              ),
          )
      )

    );
  }
}
