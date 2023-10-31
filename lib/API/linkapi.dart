 class AppLink{
  static const String server = "https://antika.dnsmsaeed.net/api";
  // static const String server = "http://127.0.0.1:8000/api";

  // static const String test = "$server/flutter/listUsers";
  static const String test = "https://jsonplaceholder.typicode.com/users/2";
  // ========================= auth ======================
  static const String signUp = "$server/flutter/register";
  static const String checkVerifyCode = "$server/flutter/checkverifycode";
  static const String login = "$server/flutter/login";
  // ========================= forgetPassword ======================
  static const String checkEmail = "$server/flutter/forgetPassword";
  static const String resetPassword = "$server/flutter/resetPassword";
 // ========================= home_controller ======================
  static const String homePage = "$server/flutter/home/get_all_data";

  // ========================= item_controller ======================
  static const String cat_items = "$server/flutter/item/get_cat_items";
  static const String add_remove_favorite = "$server/flutter/item/AddRemoveFavorite";
  static const String get_favorite_items = "$server/flutter/item/getFavoritesItems";

 // ========================= cart_controller ======================
  static const String add_to_cart = "$server/flutter/cart/addToCart";
  static const String remove_from_cart = "$server/flutter/cart/removeFromCart";
  static const String index_cart = "$server/flutter/cart/indexCart";
  static const String count_item_cart = "$server/flutter/cart/countItemCart";

  // ========================search===============================
  static const String search_item = "$server/flutter/item/searchItems";

 // ========================address===============================
  static const String view_adsress = "$server/flutter/address/IndexAddress";
  static const String add_address = "$server/flutter/address/addAddress";
  static const String delete_adsress = "$server/flutter/address/deleteAddress";


 // ========================coupon===============================

  static const String checkCuopon = "$server/flutter/coupon/CheckCoupon";

 // ========================order===============================
  static const String addOrder = "$server/flutter/order/AddOrder";
  static const String indexOrder = "$server/flutter/order/IndexOrders";
  static const String detailOrder = "$server/flutter/order/OrderDetails";
  static const String deleteOrder = "$server/flutter/order/deleteOrder";
  static const String ArchivedOrders = "$server/flutter/order/ArchivedOrders";
  static const String ratingOrder = "$server/flutter/order/ratingOrder";

 // ========================notification===============================
  static const String getNotification = "$server/flutter/notification/getNotif";

  // ========================notification===============================
  static const String offers = "$server/flutter/offer/offersData";

  // ========================chat===============================
  static const String listChat = "$server/flutter/chat/ListChats";
  static const String sendMessage = "$server/flutter/chat/sendMessage";

  // ========================conversations===============================
  static const String listConversation = "$server/flutter/conversation/ListConversation";
  static const String addConversation = "$server/flutter/conversation/addConversation";
  static const String searchUsers = "$server/flutter/conversation/searchUsers";
 }