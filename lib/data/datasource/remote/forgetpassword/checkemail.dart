import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class CheckEmailData {
  Crud crud ;
  CheckEmailData(this.crud);
  postData(String email) async{
    var response = await crud.postDate(AppLink.checkEmail, {
      "email" : email,
    });
    print('response');
    print(response);
    return response.fold((l) => l, (r) => r);

  }
}