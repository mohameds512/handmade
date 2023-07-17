import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class VerifyCodeSignUpData {
  Crud crud ;
  VerifyCodeSignUpData(this.crud);
  postData(String email,String verifyCode) async{
    var response = await crud.postDate(AppLink.checkVerifyCode, {
      "verifycode" : verifyCode,
      "email" : email,
    });
    print('responsecode');
    print(response);
    return response.fold((l) => l, (r) => r);

  }
}