import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class LoginData {
  Crud crud ;
  LoginData(this.crud);
  postData(String email,String password ,String token) async{
    var response = await crud.postDate(AppLink.login, {
      "email" : email,
      "password" : password,
      "device_token" : token
    });
    print('response');
    print(response);
    return response.fold((l) => l, (r) => r);

  }
}