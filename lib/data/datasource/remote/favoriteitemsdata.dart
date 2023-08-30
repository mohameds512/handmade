import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class FavoriteItemsData {
  Crud crud ;
  FavoriteItemsData(this.crud);
  getData(user_id) async{
    var response = await crud.postDate(AppLink.get_favorite_items, {
      "user_id":user_id.toString(),
    });

    return response.fold((l) => l, (r) => r);

  }
}