import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/constant/color.dart';

class CardPaymentMethodCheckOut extends StatelessWidget {
  final String title;
  final bool isActive;
  const CardPaymentMethodCheckOut({Key? key, required this.title, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: isActive ? AppColor.secondColor : AppColor.thirdColor
      ),
      child: Text(title,style: TextStyle(
          color:isActive ? Colors.white : AppColor.primaryColor,height: 1,fontWeight: FontWeight.bold
      ),
      ),
    );
  }
}
