import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class OrderData {
  Crud crud ;
  OrderData(this.crud);
  addData(Map data) async{
    var response = await crud.postDate(AppLink.addOrder, data);

    return response.fold((l) => l, (r) => r);

  }

  getOrders(user_id) async{
    var response = await crud.postDate(AppLink.indexOrder, {"user_id":user_id});

    return response.fold((l) => l, (r) => r);

  }

  getOrderDetails(order_id) async{
    var response = await crud.postDate(AppLink.detailOrder, {"order_id":order_id});

    return response.fold((l) => l, (r) => r);

  }



  deleteOrder(order_id) async{
    var response = await crud.postDate(AppLink.deleteOrder, {"order_id":order_id});

    return response.fold((l) => l, (r) => r);

  }

}