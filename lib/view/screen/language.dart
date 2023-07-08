import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handmade/core/constant/color.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/get.dart';
import 'package:handmade/core/constant/routes.dart';
import '../../localization/changelocal.dart';
import '../widget/language/custombuttonlang.dart';

class Language  extends GetView<LocaleController> {
  const Language ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Choose Language".tr ,style: Theme.of(context).textTheme.displayLarge,),
            const SizedBox(height: 28,),
            CustomButtonLang(textbutton: "عربي",onPressed: (){
                controller.changeLang("ar");
                Get.toNamed(AppRoute.onBoarding);
              },
            ),
            CustomButtonLang(textbutton: "EN",onPressed: (){
              controller.changeLang("en");
              Get.toNamed(AppRoute.onBoarding);
            },
            ),
            CustomButtonLang(textbutton: "DU",onPressed: (){
              controller.changeLang("du");
              Get.toNamed(AppRoute.onBoarding);
            },
            ),
          ],
        ),
      ),
    );
  }
}
