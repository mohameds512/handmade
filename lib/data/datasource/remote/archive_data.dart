import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class ArchiveData {
  Crud crud ;
  ArchiveData(this.crud);
  getArchivedOrders(user_id) async{
    var response = await crud.postDate(AppLink.ArchivedOrders, {"user_id":user_id});

    return response.fold((l) => l, (r) => r);

  }



}