import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:handmade/API/firebase_api.dart';
import 'package:handmade/binding/initial_binding.dart';
import 'package:handmade/localization/changelocal.dart';
import 'package:handmade/localization/translation.dart';
import 'package:handmade/routes.dart';
import 'package:handmade/services/services.dart';
import 'package:uni_links/uni_links.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseApi().initNotification();
  await initialServices();
  await initUniLinks();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Antika',
      locale: controller.language,
      theme: controller.appTheme ,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
