import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class CustomAppBar extends StatelessWidget {
  final String titlehinttext;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  const CustomAppBar({Key? key,  required this.titlehinttext, this.onPressedIcon, this.onPressedSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(children: [
        Expanded(child: TextFormField(
          decoration: InputDecoration(
              prefixIcon: IconButton(icon: Icon(Icons.search), onPressed: onPressedSearch,),
              hintText: titlehinttext,
              hintStyle: const TextStyle(fontSize: 18),

              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20)
              ),
              filled: true,
              fillColor: AppColor.backgroundColor
          ),
        )),
        const SizedBox(width:15),
        Container(
          decoration: BoxDecoration(
              color: AppColor.backgroundColor,
              borderRadius: BorderRadius.circular(10)
          ),

          child: IconButton(
            onPressed: onPressedIcon,
            icon: const Icon(
                Icons.notifications_active_outlined),
            iconSize: 30 ,color: Colors.grey[600],
          ),
        ),

      ],
      ),
    );
  }
}
