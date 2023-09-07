import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/constant/ImageAssets.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/view/widget/checkout/cardAddress.dart';
import 'package:handmade/view/widget/checkout/cardDeliverytype.dart';
import 'package:handmade/view/widget/checkout/cardpaymentmethod.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Title"),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        child:
        MaterialButton(
        color: AppColor.primaryColor,
        textColor: Colors.white,
        onPressed: (){},
        child: Text("Check Out",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
        children: [
            Text("Choose Payment Method",style: TextStyle(color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold),),

          CardPaymentMethodCheckOut(title: "Cash", isActive: true),
          CardPaymentMethodCheckOut(title: "VISA or Card", isActive: false),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          //   padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(20),
          //       color: AppColor.thirdColor
          //   ),
          //   child: const Text("Card or Visa",style: TextStyle(color: Colors.white,height: 1,fontWeight: FontWeight.bold),),
          // ),
          SizedBox(height: 20,),
          Text("Choose Delivery Type",style: TextStyle(color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold),),
          SizedBox(height: 20,),

          Row(

            children: [
              CardDeliveryTypeCheckout(imgName: AppImageAssets.logo, title: "Delivery", isActive: false),
              SizedBox(width: 20,),
              CardDeliveryTypeCheckout(imgName: AppImageAssets.logo, title: "Drive Thru", isActive: true),

            ],
          ),
          SizedBox(height: 20,),
          Text("Shipping Address",style: TextStyle(color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),

          CardAddressCheckOut(title: "Home", subTitle: "city", isActive: false),
          CardAddressCheckOut(title: "Home", subTitle: "city", isActive: true),
        ],

      ),
      ),
    );
  }
}
