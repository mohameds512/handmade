
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/constant/color.dart';

class CardOrderList extends StatelessWidget {
  final String? orderNum;
  final String? DeliveryType;
  final String? orderPrice;
  final String? DeliveryPrice;
  final String? paymentMethod;
  final String? totalPrice;
  final String? status;
  final String? added_ago;
  final void Function()? onPressedDetails;
  final void Function()? onPressedDelete;
  const CardOrderList({Key? key, this.orderNum, this.DeliveryType, this.orderPrice, this.DeliveryPrice, this.paymentMethod, this.totalPrice, this.status, this.added_ago, this.onPressedDetails, this.onPressedDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Text("Order Number : $orderNum" ,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            Spacer(),
            Text("$added_ago",style: TextStyle(fontFamily: "sans",color: AppColor.primaryColor),),
          ]),
          Divider(),
          Text("Order Type : $DeliveryType"),
          Text("Order Price : $orderPrice \$"),
          Text("Delivery Price : $DeliveryPrice \$"),
          Text("Payment Method : $paymentMethod"),
          Text("Status : $status"),
          Divider(),
          Row(
            children: [
              Text("Total Price : $totalPrice" ,style: TextStyle(color: AppColor.shadowPrimaryColor,fontSize: 18,fontWeight: FontWeight.bold),),
              Spacer(),
              MaterialButton(
                onPressed: onPressedDetails,
                child: Text("Details",style: TextStyle(color: AppColor.primaryColor,fontWeight: FontWeight.bold),),
                color: AppColor.grey,
              ),
              SizedBox(width: 10,),
              if(status == "Pending")
              MaterialButton(
                onPressed: onPressedDelete,
                child: Text("Delete",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                color: AppColor.redColor,
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
