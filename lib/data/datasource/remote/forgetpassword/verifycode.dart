import 'package:handmade/API/linkapi.dart';
import 'package:handmade/core/class/crud.dart';

class VerifyCodeForgetPasswordData {
  Crud crud ;
  VerifyCodeForgetPasswordData(this.crud);
  postData(String email,String verifyCode) async{
    var response = await crud.postDate(AppLink.checkVerifyCode, {
      "email" : email,
      "verifycode" : verifyCode,
    });
    print('response');
    print(response);
    return response.fold((l) => l, (r) => r);

  }
}