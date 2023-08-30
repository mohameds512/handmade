import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/view/widget/cart/buttonorder.dart';

class CustomBottomNavigationBarCart extends StatelessWidget {
  final String price;
  final String shipping;
  final String TotalPrice;
  const CustomBottomNavigationBarCart({Key? key, required this.price, required this.shipping, required this.TotalPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("price ",style: TextStyle(fontSize: 18),),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("$price \$",style: TextStyle(fontSize: 18),),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Shipping",style: TextStyle(fontSize: 18),),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("$shipping",style: TextStyle(fontSize: 18),),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child:Divider(color: Colors.black,),

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Total Price",style: TextStyle(fontSize: 18),),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("$TotalPrice",style: TextStyle(fontSize: 18),),
            ),
          ],
        ),
        SizedBox(height: 10,),
        CustomButtonOrderCart(textbutton: "Add To Cart",onPressed: (){})
      ],
    ),);
  }
}
