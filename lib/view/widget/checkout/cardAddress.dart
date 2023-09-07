import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/constant/color.dart';

class CardAddressCheckOut extends StatelessWidget {
  final String title;
  final String subTitle;
  final bool isActive;
  const CardAddressCheckOut({Key? key, required this.title, required this.subTitle, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isActive ? AppColor.primaryColor: null ,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        title: Text(title,style: TextStyle(fontWeight: FontWeight.bold,color: isActive ? Colors.white : null)),
        subtitle: Text(subTitle,style: TextStyle(color: isActive ? Colors.white : null),),
      ),
    );
  }
}
