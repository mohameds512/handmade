import 'package:get/get.dart';

import '../../core/constant/routes.dart';
abstract class SuccessSignUpController extends GetxController {
  goLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController  {
  @override
  goLogin() {
    Get.offAllNamed(AppRoute.login);
  }

}