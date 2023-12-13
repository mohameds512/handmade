import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/view/widget/chat/custommesssageicon.dart';

import '../../core/constant/color.dart';
import 'package:get/get.dart';
class CustomAppBar extends StatelessWidget {
  final String titlehinttext;
  // final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  final void Function()? onPressedIconFavorite;
  final void Function(String)? onChanged;
  final TextEditingController myController;
  const CustomAppBar(
      {Key? key,
        required this.titlehinttext,
        this.onPressedSearch, this.onPressedIconFavorite,
        this.onChanged,
        required this.myController
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      height: 50,

      // padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(children: [
        Expanded(child: TextFormField (
          onTapOutside: (event)=>FocusScope.of(context).unfocus(),
          controller: myController,
          onChanged: onChanged,
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

        IconButton(
          onPressed: onPressedIconFavorite,

          icon: const Icon(
            Icons.favorite,color: AppColor.primaryColor,size: 34,),
          iconSize: 30 ,color: Colors.grey[600],
        ),
        CustomMessageIcon(),

      ],
      ),
    );
  }
}
