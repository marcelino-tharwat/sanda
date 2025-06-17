class ApiConstant {
  static const String apiBaseUrl = 'https://192.168.1.6:5001/api/';
  static const String login = 'User/login';
  static const String signUp = 'User/signup';
  static const String user = 'User/profile/{id}';
  static const String updateProfile = 'User/update-profile/{id}';
  static const String forgetPassword = 'User/forgetPassword';
  static const String category = 'ServiceItems/category/{categoryName}';
  static const String allProduct = 'Product';
  static const String addToCart = "User/addProductList/{productId}/{userId}";
  static const String removeFromCart =
      "User/removeFromProductList/{productId}/{userId}";
  static const String getCart = "User/getUserProducts/{userId}";
  static const String makeOrder = "Order";
  static const String getAllUserOrder = "/User/orders/{userId}";
  static const String cancelOrder = "Order/{orderID}/cancel";
  static const String addFavService = 'User/{userId}/favorites/{serviceId}';
  static const String removeFavService = 'User/{userId}/favorites/{favoriteId}';
  static const String getUserFavServices = 'User/{userId}/favorites';
}
