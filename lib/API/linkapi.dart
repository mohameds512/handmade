 class AppLink{
  static const String server = "http://127.0.0.1:8000/api";

  static const String test = "$server/flutter/listUsers";
  // ========================= auth ======================
  static const String signUp = "$server/flutter/register";
  static const String checkVerifyCode = "$server/flutter/checkverifycode";
  static const String login = "$server/flutter/login";
  // ========================= forgetPassword ======================
  static const String checkEmail = "$server/flutter/forgetPassword";
  static const String resetPassword = "$server/flutter/resetPassword";
 // ========================= home_controller ======================
  static const String homePage = "$server/flutter/home/get_all_data";
  // static const String test = "https://jsonplaceholder.typicode.com/users/2";


 }