import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/constant/color.dart';

class TopCardCart extends StatelessWidget {
  final String desc;
  const TopCardCart({Key? key, required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(bottom: 3,top: 3),
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Text(
        desc,
        textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold,fontFamily: "sans"),
      ),
    )
    ;
  }
}
