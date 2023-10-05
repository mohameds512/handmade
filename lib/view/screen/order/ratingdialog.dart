import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/controller/order/archived_controller.dart';
import 'package:handmade/core/constant/ImageAssets.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:rating_dialog/rating_dialog.dart';

// show the dialog
void showRatingDialog(BuildContext context ,String? order_id,item_id){
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
      initialRating: 1.0,
      // your app's name?
      title: Text(
        'Rating Dialog',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
      // encourage your user to leave a high rating?
      message: Text(
        'Tap a star to set your rating. Add more description here if you want.',
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 15),
      ),
      // your app's logo?
      image: Image.asset(AppImageAssets.logo,width: 200,height: 200,),
      submitButtonText: 'Submit',
      submitButtonTextStyle: TextStyle(color: AppColor.primaryColor),
      commentHint: 'Set your custom comment hint',
      onCancelled: () => print('cancelled'),
      starColor: AppColor.primaryColor,
      onSubmitted: (response) {
          ArchivedController controller = Get.put(ArchivedController());
        print('rating: ${response.rating}, comment: ${response.comment}');
          controller.submitRating(order_id,item_id,response.rating,response.comment);

        // TODO: add your own logic
        // if (response.rating < 3.0) {
        //   // send their comments to your email or anywhere you wish
        //   // ask the user to contact you instead of leaving a bad review
        // } else {
        //   _rateAndReviewApp();
        // }
      },
    )
    ,
  );
}