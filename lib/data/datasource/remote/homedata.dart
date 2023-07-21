import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class HomeData {
  Crud crud ;
  HomeData(this.crud);
  getData() async{
    var response = await crud.postDate(AppLink.homePage, {});

    return response.fold((l) => l, (r) => r);

  }
}