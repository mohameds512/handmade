import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../../core/constant/color.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String bodytext;
  const CustomTextBodyAuth({Key? key, required this.bodytext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        bodytext.tr,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayMedium!.copyWith(color: AppColor.grey)
    );
  }
}
