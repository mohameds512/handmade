import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class ResetPasswordData {
  Crud crud ;
  ResetPasswordData(this.crud);
  postData(String email,String password) async{
    var response = await crud.postDate(AppLink.resetPassword, {
      "email" : email,
      "password" : password,
    });
    print('response');
    print(response);
    return response.fold((l) => l, (r) => r);

  }
}