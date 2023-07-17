import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class SignUpData {
  Crud crud ;
  SignUpData(this.crud);
  postData(String username ,String email,String password,String phone ) async{
    var response = await crud.postDate(AppLink.signUp, {
      "username" : username,
      "email" : email,
      "password" : password,
      "phone" : phone,
    });
    print('response');
    print(response);
    return response.fold((l) => l, (r) => r);

  }
}