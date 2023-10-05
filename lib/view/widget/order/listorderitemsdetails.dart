import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:handmade/core/functions/DBtranslation.dart';
import 'package:handmade/view/screen/order/ratingdialog.dart';

class ListOrderItemDetail extends StatelessWidget {
  final Map orderItem;
  const ListOrderItemDetail({Key? key, required this.orderItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Container(

        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Table(
              children: [
                TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text("Name",textAlign: TextAlign.center,style: TextStyle(color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child:Text(TransDB(orderItem?["name"]),textAlign: TextAlign.center,),
                      )
                    ]
                ),
                TableRow(
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                    ),
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text("Count",textAlign: TextAlign.center,style: TextStyle(color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(orderItem!["item_count"].toString(),textAlign: TextAlign.center),
                      ),
                    ]
                ),
                TableRow(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text("Price",textAlign: TextAlign.center,style: TextStyle(color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child:Text(orderItem!["all_price"].toStringAsFixed(2),textAlign: TextAlign.center,),
                      )
                    ]
                ),
                TableRow(
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                    ),
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text("Code",textAlign: TextAlign.center,style: TextStyle(color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(orderItem!["item_code"],textAlign: TextAlign.center,),
                      ),
                    ]
                ),
                TableRow(

                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text("Shipping",textAlign: TextAlign.center,style: TextStyle(color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text('00.00',textAlign: TextAlign.center),
                      ),
                    ]
                ),
                TableRow(
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                    ),
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text("Status",textAlign: TextAlign.center,style: TextStyle(color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(orderItem!["item_count"].toString(),textAlign: TextAlign.center),
                      ),
                    ]
                ),
                TableRow(

                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text("Total Price",textAlign: TextAlign.center,style: TextStyle(color: AppColor.shadowPrimaryColor,fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text('price + shipping',textAlign: TextAlign.center),
                      ),
                    ]
                ),
                if(orderItem["rating"] == null)
                TableRow(
                    children: [
                      Text(""),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child:
                        InkWell(
                          onTap: (){
                            showRatingDialog(context,orderItem!["cart_order_id"].toString()!,orderItem!["id"].toString()!);
                          },
                          child: Text("+ add Rate",style: TextStyle(color: AppColor.primaryColor,),textAlign: TextAlign.right,),
                        ),
                      )

                    ]
                ),
                if(orderItem["rating"] != null)
                  TableRow(
                      children: [
                        Text(""),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: List.generate(
                              5,
                              (index) => GestureDetector(

                                child: Icon(
                                  index < orderItem["rating"] ? index+1 < orderItem["rating"] ? Icons.star : Icons.star_half : Icons.star_border,
                                  color: index < orderItem["rating"] ? AppColor.primaryColor : Colors.grey,
                                  size: 18,
                                ),
                                onTap: () {
                                // Handle the rating selection
                                print('Selected rating: ${index + 1}');
                              },
                            ),
                          ),
                        )
                        )

                      ]
                  )
              ],

            ),

          ],
        ),

      ),

    );
  }
}
