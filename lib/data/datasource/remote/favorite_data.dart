import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class FavoriteData {
  Crud crud ;
  FavoriteData(this.crud);
  getData(item_id,user_id) async{
    var response = await crud.postDate(AppLink.add_remove_favorite, {
      "item_id":item_id.toString(),
      "user_id":user_id.toString(),
    });

    return response.fold((l) => l, (r) => r);

  }
}