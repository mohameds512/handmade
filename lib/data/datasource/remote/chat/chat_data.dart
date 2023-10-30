
import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class ChatData{
  Crud crud;
  ChatData(this.crud);
  
  GetChatList(conver_id) async{
    var response = await crud.postDate(AppLink.listChat, {
      "conver_id":conver_id,
    }
    );
    return response.fold((l) => l, (r) => r);

  }
  SendMessage(sender_id,receiver_id,conver_id,message) async{
    var response = await crud.postDate(AppLink.sendMessage, {
      "sender_id":sender_id.toString(),
      "receiver_id":receiver_id.toString(),
      "conver_id":conver_id.toString(),
      "message":message,
    }
    );
    return response.fold((l) => l, (r) => r);

  }

}