import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:handmade/controller/items_controller.dart';

import '../../../core/constant/color.dart';
import '../../../core/functions/DBtranslation.dart';
import '../../../data/model/categoriesModel.dart';

class ListCategoriesItems extends GetView<ItemControllerImp> {
  const ListCategoriesItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemCount: controller.categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Categories(
            categoriesModel:
            CategoriesModel.fromJson(controller.categories[index]),
            i: CategoriesModel.fromJson(controller.categories[index]).id,
            Index:index,
          );
        },
      ),
    );
  }
}

class Categories extends GetView<ItemControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  final Index;

  const Categories( {Key? key, required this.categoriesModel, required this.i, required  this.Index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // controller.goToItems(controller.categories, i!);
        controller.changeCat(i!);
      },
      child: Column(
        children: [
          GetBuilder<ItemControllerImp>(
              builder: (controller) => Container(

                padding: EdgeInsets.only(right: 10 , left: 10 , bottom: 5),
                decoration: categoriesModel.id == controller.cat_id
                    ? BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            width: 3, color: AppColor.primaryColor)))
                    : null,
                child: Text(
                  TransDB(controller.categories[Index]["name"]),
                  style:
                  const TextStyle(fontSize: 20, color: AppColor.grey_2),
                ),
              ))
        ],
      ),
    );
  }
}