
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
  addConversation(user_id_1,user_id_2) async{
    var response = await crud.postDate(AppLink.addConversation, {
      "user_id_1":user_id_1.toString(),
      "user_id_2":user_id_2.toString(),
    }
    );
    return response.fold((l) => l, (r) => r);
  }

  searchUsers(keyword)async{

    var response = await crud.postDate(AppLink.searchUsers, {
      "keyword":keyword,
    }
    );

    return response.fold((l) => l, (r) => r);
  }

}