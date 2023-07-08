import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:handmade/core/functions/validinput.dart';

import '../../../core/constant/color.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? myController;
  final String? Function(String?)? valid;
  final bool isNumber ;
  final bool? obscureText ;
  final void Function()? onTapIcon;
  const CustomTextFormAuth(
      {
        Key? key,
        this.obscureText,
        required this.hinttext,
        required this.labeltext,
        required this.iconData,
        required this.myController,
        required this.valid, required this.isNumber,
        this.onTapIcon,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom:22),
      child: TextFormField(
        keyboardType: isNumber? TextInputType.number : TextInputType.text,
        validator: valid,
        obscureText: obscureText == null || obscureText == false ? false : true ,
        decoration: InputDecoration(
            hintText: hinttext.tr,
            hintStyle: const TextStyle(fontSize: 13,color: AppColor.grey),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding: const EdgeInsets.symmetric(vertical: 5,horizontal: 35),
            label: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(labeltext.tr)
            ),
            suffixIcon: InkWell(onTap: onTapIcon,child: Icon(iconData) ,),
            suffixIconColor: AppColor.grey,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30)
            )
        ),

      ),
    );

  }
}
