import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../core/constant/color.dart';

class CustomTextSignUp extends StatelessWidget {
  final String ftext;
  final String ltext;
  final void Function()  onTap;
  const CustomTextSignUp({Key? key, required this.ftext, required this.ltext, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(ftext.tr),
        InkWell(
          onTap: onTap,
          child: Text(
            ltext.tr,
            style: const TextStyle(
              color: AppColor.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
