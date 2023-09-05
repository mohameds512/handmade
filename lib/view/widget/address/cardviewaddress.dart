import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/constant/color.dart';

class CardViewAddress extends StatelessWidget {
  final Map address;
  final void Function()? onPressedDelete;
  const CardViewAddress({Key? key, required this.address, this.onPressedDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding:EdgeInsets.all(10) ,
        child: ListTile(
          title: Text(address["name"]!),
          subtitle: Text("${address["city"] } _ ${address["street"]}"),
          trailing: IconButton(
            onPressed: onPressedDelete,
            icon: Icon(Icons.delete_outline,color: AppColor.shadowPrimaryColor,),
          ),
        ),
      ),
    );
  }
}