import 'package:get/get_utils/get_utils.dart';
import 'package:password_strength/password_strength.dart';
String password = "" ;
validInput(String val,int min,int max,String type){

  if(val.isEmpty){
    return "can't be empty".tr;
  }

 if(type == "username") {
  if(!GetUtils.isUsername(val)){
    return "not valid username".tr;
  }
 }
 if(type == "email") {
   if(!GetUtils.isEmail(val)){
     return "not valid email".tr;
   }
 }
 if(type == "phone") {
   if(!GetUtils.isPhoneNumber(val)){
     return "not valid phone".tr;
   }
 }
 if(type == "phone") {
   if(!GetUtils.isPhoneNumber(val)){
     return "not valid phone".tr;
   }
 }
 if(type == "password") {
   password = val;
   double strength = estimatePasswordStrength(val);
   if (strength < 0.7){
     return "weak password";
   }
 }
  if(type == "confirm_password") {

    if(password != val){

      return "dose not match the password";
    }
  }

 if(val.length < min){
    return "${"the minimum is".tr} $min";
 }
 if(val.length > max){
   return "${"the maximum is".tr} $max";
 }
}