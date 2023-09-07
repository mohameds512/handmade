import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/constant/ImageAssets.dart';
import 'package:handmade/core/constant/color.dart';

class CardDeliveryTypeCheckout extends StatelessWidget {
  final String imgName;
  final String title;
  final bool isActive;
  const CardDeliveryTypeCheckout({Key? key, required this.imgName, required this.title, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120, width: 120,
      decoration: BoxDecoration(
          color: isActive ? AppColor.primaryColor :null ,
          border: Border.all(color: AppColor.primaryColor)
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imgName,width: 60,),
            Text(title,style: TextStyle(color: isActive ? Colors.white : AppColor.primaryColor,fontWeight: FontWeight.bold),)
          ]
      ),
    );
  }
}
