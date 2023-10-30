import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/constant/color.dart';

class CustomInputMessage extends StatelessWidget {
  final TextEditingController? myController;
  final void Function()? onPressedSend;

  const CustomInputMessage({Key? key, this.myController, this.onPressedSend}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 10,right: 10,top: 10,
          bottom:MediaQuery.of(context).viewInsets.bottom + 20),
      child: Container(
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.black12
        ),
        child: Row(
          children: [
            Expanded(child: TextField(
              controller: myController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Message",
                hintStyle: TextStyle(fontSize: 18)
              ),
            )
            ),
            InkWell(
              onTap: onPressedSend,
              child:Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(50)
                ),
                child:  Icon(
                  Icons.send,
                  color: AppColor.primaryColor,
                ),
              )
            ),

          ],
        ),
      ),
    );
  }
}
