import 'package:get/get.dart';
import 'package:handmade/core/constant/routes.dart';
abstract class SuccessResetPasswordController extends GetxController {

  goLogin();
}
class SuccessResetPasswordControllerImp extends SuccessResetPasswordController  {
  @override
  goLogin() {
    Get.offAllNamed(AppRoute.login);
  }

}