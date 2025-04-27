class ApiConstant {
  static const String apiBaseUrl = 'https://10.0.2.2:5001/api/';
  static const String login = 'User/login';
  static const String signUp = 'User/signup';
  static const String profile = 'User/profile/{id}';
  static const String updateProfile = 'User/update-profile/{id}';
  static const String forgetPassword = 'User/forgetPassword';
  static const String category = 'ServiceItems/category/{categoryName}';
  static const String allProduct = 'Product';
  static const String addToCart = "User/addProductList/{productId}/{userId}";
  static const String removeFromCart =
      "User/removeFromProductList/{productId}/{userId}";
  static const String getCart = "User/getUserProducts/{userId}";
  
}
