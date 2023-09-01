import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class CatItemsData {
  Crud crud ;
  CatItemsData(this.crud);
  getData(cat_id,user_id) async{
    var response = await crud.postDate(AppLink.cat_items, {
      "cat_id":cat_id.toString(),
      "user_id":user_id.toString(),
    });

    return response.fold((l) => l, (r) => r);

  }
  searchItems(keyword) async{
    var response = await crud.postDate(AppLink.search_item, {
      "keyword":keyword
    });

    return response.fold((l) => l, (r) => r);

  }
}