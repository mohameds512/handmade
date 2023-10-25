
import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class ChatData{
  Crud crud;
  ChatData(this.crud);
  
  GetChatList(user_id) async{
    var response = await crud.postDate(AppLink.listChat, {
      "user_id":user_id.toString(),
    }
    );
    return response.fold((l) => l, (r) => r);

  }
  SendMessage(sender_id,receiver_id,message) async{
    var response = await crud.postDate(AppLink.sendMessage, {
      "sender_id":sender_id.toString(),
      "receiver_id":receiver_id.toString(),
      "message":message,
    }
    );
    return response.fold((l) => l, (r) => r);

  }

}