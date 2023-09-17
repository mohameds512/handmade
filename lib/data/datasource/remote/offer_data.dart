import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class OfferData {
  Crud crud ;
  OfferData(this.crud);
  getData() async{
    var response = await crud.postDate(AppLink.offers, {});

    return response.fold((l) => l, (r) => r);

  }
}