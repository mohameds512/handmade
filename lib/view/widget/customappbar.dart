import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

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
      margin: const EdgeInsets.only(top: 10),
      // padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(children: [
        Expanded(child: TextFormField(
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
        const SizedBox(width:15),
        // Container(
        //   decoration: BoxDecoration(
        //       color: AppColor.backgroundColor,
        //       borderRadius: BorderRadius.circular(10)
        //   ),
        //
        //   child: IconButton(
        //     onPressed: onPressedIcon,
        //     icon: const Icon(
        //         Icons.notifications_active_outlined),
        //     iconSize: 30 ,color: Colors.grey[600],
        //   ),
        // ),
        // const SizedBox(width:15),
        Container(
          // height: 55,
          decoration: BoxDecoration(
              color: AppColor.backgroundColor,
              borderRadius: BorderRadius.circular(10),

          ),
          padding: EdgeInsets.symmetric(vertical: 8),
          width: 60,
          child: IconButton(
            onPressed: onPressedIconFavorite,

            icon: const Icon(
                Icons.favorite,color: AppColor.primaryColor,size: 34,),
            iconSize: 30 ,color: Colors.grey[600],
          ),
        ),

      ],
      ),
    );
  }
}
