import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class AddressData {
  Crud crud ;
  AddressData(this.crud);
  addData(String user_id,String name,String phone,String city,String street,String lat,String long) async{
    var response = await crud.postDate(AppLink.add_address, {
      "name":name,
      "phone":phone,
      "user_id":user_id,
      "city":city,
      "street":street,
      "address_lat":lat,
      "address_long":long,
    });

    return response.fold((l) => l, (r) => r);

  }
  getAddresses(String user_id) async{
    var response = await crud.postDate(AppLink.view_adsress, {
      "user_id":user_id
    });

    return response.fold((l) => l, (r) => r);

  }

  deleteAddress(String address_id) async{
    var response = await crud.postDate(AppLink.delete_adsress, {
      "address_id":address_id
    });

    return response.fold((l) => l, (r) => r);

  }

}