import 'package:get/get.dart';
import 'package:handmade/controller/cart/cart_controller.dart';
import 'package:handmade/core/class/statusrequest.dart';

abstract class ProductDetailsController extends GetxController{

}

class   ProductDetailsControllerImp extends ProductDetailsController{
  CartController cartController = Get.put(CartController());
  late StatusRequest statusRequest;
  Map? Item;
  int coutItemCart = 0;
  intialData() async {
    statusRequest = StatusRequest.loading;
    Item = Get.arguments["selectedItem"];
    coutItemCart = await cartController.countItemCart(Item!["id"]);
    statusRequest = StatusRequest.success;
    update();
  }
  List itemColors = [
    "Red","Black","Green"
  ];
  @override
  addCountItemCart(item_id){
    coutItemCart++;
    update();
    cartController.addToCart(item_id);
  }

  @override
  removeCountItemCart(item_id){
    if(coutItemCart >0){
      cartController.removeFromCart(item_id);
      coutItemCart--;
    }
    update();
  }
  @override
  void onInit() {
     intialData();
    super.onInit();
  }
}