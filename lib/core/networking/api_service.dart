import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sanda/core/networking/api_constant.dart';
import 'package:sanda/features/auth/forget_password/data/models/email_forget_pass_req_model.dart';
import 'package:sanda/features/auth/forget_password/data/models/email_forget_pass_res_model.dart';
import 'package:sanda/features/auth/login/data/models/login_req_model.dart';
import 'package:sanda/features/auth/login/data/models/login_res_model.dart';
import 'package:sanda/features/auth/sign_up/data/models/sign_up_req_model.dart';
import 'package:sanda/features/auth/sign_up/data/models/sign_up_res_model.dart';
import 'package:sanda/features/cart/data/model/product_card_model.dart';
import 'package:sanda/features/favorite/data/model/add_fav_res_model.dart';
import 'package:sanda/features/favorite/data/model/fav_list_res_model.dart';
import 'package:sanda/features/home/data/model/category_model.dart';
import 'package:sanda/features/home/data/model/order_req_model.dart';
import 'package:sanda/features/home/data/model/order_res_model.dart';
import 'package:sanda/features/order/data/model/user_order_res_model.dart';
import 'package:sanda/features/profile/data/models/user_res.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;
  //signup
  @POST(ApiConstant.signUp)
  Future<SignUpResModel> signUp(@Body() SignUpReqModel signUpReqModel);

  //login
  @POST(ApiConstant.login)
  Future<LoginResModel> login(@Body() LoginReqModel loginReqModel);

  //forget password
  @POST(ApiConstant.forgetPassword)
  Future<EmailForgetPassResModel> forgetPassword(
      @Body() EmailForgetPassReqModel emailForgetPassReqModel);

  //profile user
  @GET(ApiConstant.user)
  Future<UserResponse> userData(@Path('id') int id);

  //update profile user
  @PUT(ApiConstant.updateProfile)
  Future<UserResponse> updateProfileData(
      @Path('id') int id, @Body() UserResponse userResponse);

  //get service by Category
  @GET(ApiConstant.category)
  Future<List<ProductOrServiceModel>> getServiceByCategory(
      @Path('categoryName') String categoryName);

  //get product by Category
  @GET(ApiConstant.allProduct)
  Future<List<ProductOrServiceModel>> getAllProduct();

  ///cartServices

  // addToCart
  @POST(ApiConstant.addToCart)
  Future<String> addToCart(
      @Path("productId") int productId, @Path("userId") int userId);

  //deleteFromCart
  @DELETE(ApiConstant.removeFromCart)
  Future<String> removeFromCart(
      @Path("productId") int productId, @Path("userId") int userId);
  //getcart
  @GET(ApiConstant.getCart)
  Future<List<ProductCardModel>> getCart(@Path("userId") int userId);

  //order
  @POST(ApiConstant.makeOrder)
  Future<OrderResModel> makeOrder(@Body() OrderReqModel orderReqModel);

  //AllUderOrder
  @GET(ApiConstant.getAllUserOrder)
  Future<List<UserOrderResModel>> getAllUserOrder(@Path("userId") int userId);

  //deleteOrder
  @POST(ApiConstant.cancelOrder)
  Future<String> deleteOrder(@Path("orderId") int orderId);

  //favorite
  @POST(ApiConstant.addFavService)
  Future<AddFavResModel> addFavService(
      @Path("userId") int userId, @Path("serviceId") int serviceId);

  @GET(ApiConstant.getUserFavServices)
  Future<List<FavListResModel>> getUserFavServices(@Path("userId") int userId);
  @DELETE(ApiConstant.removeFavService)
  Future<String> deleteFavService(
      @Path("userId") int userId, @Path("productId") int productId);
}
