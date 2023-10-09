
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:photo_view/photo_view.dart';

class DetailScreen extends StatelessWidget {
  final String ImgUrl;
  final String productName;
  const DetailScreen({Key? key, required this.ImgUrl, required this.productName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(productName),
      ),
      body: GestureDetector(

        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: CachedNetworkImage(
              imageUrl: ImgUrl,
              imageBuilder: (context, image_Provider) => Container(
                child: PhotoView(
                  imageProvider: image_Provider,
                  backgroundDecoration: BoxDecoration(
                    color: AppColor.secondColor
                  ),
                ),

                ),
              ),
            ),
          ),
        ),
        // onTap: () {
        //   Navigator.pop(context);
        // },

    );
  }
}
