import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/constant/color.dart';

class CustomBottomCoupon extends StatelessWidget {
  final String desc;
  final void Function()? onPressed;
  const CustomBottomCoupon({Key? key, required this.desc, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      // margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: onPressed,
        child: Text(desc,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11),),
      ),
    )
    ;
  }
}
