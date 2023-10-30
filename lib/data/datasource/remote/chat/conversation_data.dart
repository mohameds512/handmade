
import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class ConversationData{
  Crud crud;
  ConversationData(this.crud);

  GetConversationList(user_id) async{
    var response = await crud.postDate(AppLink.listConversation, {
      "user_id":user_id.toString(),
    }
    );
    return response.fold((l) => l, (r) => r);

  }
  addConversation(sender_id,receiver_id) async{
    var response = await crud.postDate(AppLink.addConversation, {
      "sender_id":sender_id.toString(),
      "receiver_id":receiver_id.toString(),
    }
    );
    return response.fold((l) => l, (r) => r);

  }

}