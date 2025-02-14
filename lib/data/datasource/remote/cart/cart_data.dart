import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class CartData {
  Crud crud ;
  CartData(this.crud);
  addToCart(item_id,user_id,item_info,cumulativePrice,count) async{
    var response = await crud.postDate(AppLink.add_to_cart, {
      "item_id":item_id.toString(),
      "user_id":user_id.toString(),
      "item_info" : item_info,
      "cumulativePrice" : cumulativePrice.toString(),
      "count" : count.toString(),
    });
    return response.fold((l) => l, (r) => r);

  }
  removeFromCart(cart_id,user_id) async{
    var response = await crud.postDate(AppLink.remove_from_cart, {
      "cart_id":cart_id.toString(),
      "user_id":user_id.toString(),
    });

    return response.fold((l) => l, (r) => r);

  }

  countItemCart(item_id,user_id) async{
    var response = await crud.postDate(AppLink.count_item_cart, {
      "item_id":item_id.toString(),
      "user_id":user_id.toString(),
    });

    return response.fold((l) => l, (r) => r);

  }
  indexCart(user_id) async{

    var response = await crud.postDate(AppLink.index_cart, {
      "user_id":user_id.toString(),
    });
    return response.fold((l) => l, (r) => r);

  }
  checkCoupon(name) async{
    var response = await crud.postDate(AppLink.checkCuopon, {
      "name":name,
    });

    return response.fold((l) => l, (r) => r);

  }
}