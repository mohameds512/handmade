import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class HomeData {
  Crud crud ;
  HomeData(this.crud);
  getData() async{
    var response = await crud.postDate(AppLink.homePage, {});

    return response.fold((l) => l, (r) => r);

  }

  getNearest(lat,long,limit,radius) async{
    var response = await crud.postDate(AppLink.nearestStores, {
      "lat":lat,
      "long":long,
      "limit":limit.toString(),
      "radius":radius.toString(),
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