import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/constant/color.dart';

class CustomButtomAppBar extends StatelessWidget {
  final String icontitle;
  final IconData icondata;
  bool active = false;
  final void Function()? onPressedIcon;
  CustomButtomAppBar(
      {Key? key,
        required this.icontitle,
        required this.icondata,
        required this.onPressedIcon,
        required this.active}
        ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressedIcon,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icondata,color: active ? AppColor.primaryColor : AppColor.grey_2,),
          Text(icontitle,style: TextStyle(color: active ? AppColor.primaryColor : AppColor.grey_2,)
          )
        ],
      ),
    );
  }
}
