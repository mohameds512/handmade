import 'package:flutter/cupertino.dart';

import '../../../core/constant/color.dart';

class CustomTitleHome extends StatelessWidget {
  final String texttitle;
  const CustomTitleHome({Key? key, required this.texttitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(texttitle,style: TextStyle(fontSize: 20,color: AppColor.primaryColor,fontWeight: FontWeight.bold),));
  }
}
