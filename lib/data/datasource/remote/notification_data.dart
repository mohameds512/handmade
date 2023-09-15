import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class NotificationData {
  Crud crud ;
  NotificationData(this.crud);
  getData(user_id) async{
    var response = await crud.postDate(AppLink.getNotification, {'user_id' : user_id});

    return response.fold((l) => l, (r) => r);

  }





}