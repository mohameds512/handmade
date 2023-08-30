import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomButtonOrderCart extends StatelessWidget {
  final String textbutton;
  final void Function()? onPressed;
  const CustomButtonOrderCart({Key? key, required this.textbutton , this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: MaterialButton(
          onPressed: onPressed,
          color: AppColor.primaryColor,
          textColor: Colors.white,
          child: Text(textbutton , style: const TextStyle(fontWeight: FontWeight.bold),),
        )

    );
  }
}
