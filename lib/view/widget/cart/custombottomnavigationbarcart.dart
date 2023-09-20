import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/cart/cart_controller.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/constant/routes.dart';
import 'package:handmade/view/widget/cart/buttonorder.dart';
import 'package:handmade/view/widget/cart/custombottomcoupon.dart';
import 'package:get/get.dart';
class CustomBottomNavigationBarCart extends GetView<CartController> {
  final String price;
  // final String discount;
  final String shipping;
  final String TotalPrice;
  final int couponDiscount;
  final String couponName;
  final TextEditingController? controllerCoupon;
  final void Function()? onApplyCoupon;
  const CustomBottomNavigationBarCart({Key? key,
    required this.price,
    // required this.discount,
    required this.TotalPrice,
    this.controllerCoupon, this.onApplyCoupon, required this.shipping, required this.couponDiscount, required this.couponName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        couponDiscount <= 0 ?
          Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(children: [
            Expanded(
              flex: 2,
                child: TextFormField(
                  onTapOutside: (event)=>FocusScope.of(context).unfocus(),
                  controller: controllerCoupon,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                    hintText: "Coupon Code",
                    border: OutlineInputBorder()
                  ),
                ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex:1,
                child: CustomBottomCoupon(desc: "applay",onPressed: onApplyCoupon)
            )
          ],
          ),
        ) : Center(child: Container(
          padding: EdgeInsets.only(top: 5),
          child: Text("Coupon Code: $couponName",style: TextStyle(fontSize: 15,color: AppColor.shadowPrimaryColor)),
        )),
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.brown,width: 0.5),
            borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            children: [
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
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Container(
              //       padding: EdgeInsets.symmetric(horizontal: 20),
              //       child: Text("Discount",style: TextStyle(fontSize: 18),),
              //     ),
              //     Container(
              //       padding: EdgeInsets.symmetric(horizontal: 20),
              //       child: Text("$discount",style: TextStyle(fontSize: 18),),
              //     ),
              //   ],
              // ),
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
              if(couponDiscount > 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Coupon Discount",style: TextStyle(fontSize: 18),),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$couponDiscount %",style: TextStyle(fontSize: 18),),
                  ),
                ],
              ),
              if(couponDiscount > 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Coupon Name",style: TextStyle(fontSize: 18),),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$couponName",style: TextStyle(fontSize: 18),),
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
                    child: Text("Total Price",style: TextStyle(fontSize: 18,color: AppColor.shadowPrimaryColor),),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("$TotalPrice",style: TextStyle(fontSize: 18,color: AppColor.shadowPrimaryColor),),
                  ),
                ],
              ),
            ],
          ),
        ),
        CustomButtonOrderCart(textbutton: "Order",onPressed: (){
          controller.goToCheckoutPage();
        })
      ],
    ),);
  }
}
