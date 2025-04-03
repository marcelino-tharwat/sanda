import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sanda/core/networking/api_constant.dart';
import 'package:sanda/features/auth/forget_password/data/models/email_forget_pass_req_model.dart';
import 'package:sanda/features/auth/forget_password/data/models/email_forget_pass_res_model.dart';
import 'package:sanda/features/auth/login/data/models/login_req_model.dart';
import 'package:sanda/features/auth/login/data/models/login_res_model.dart';
import 'package:sanda/features/auth/sign_up/data/models/sign_up_req_model.dart';
import 'package:sanda/features/auth/sign_up/data/models/sign_up_res_model.dart';
import 'package:sanda/features/home/data/model/category_model.dart';
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
  @GET(ApiConstant.profile)
  Future<UserResponse> profileData(@Path('id') int id);

  //update profile user
  @PUT(ApiConstant.updateProfile)
  Future<UserResponse> updateProfileData(
      @Path('id') int id, @Body() UserResponse userResponse);

  //get Category
  @GET(ApiConstant.category)
  Future<List<CategoryModel>> getCategory(
      @Path('categoryName') String categoryName);
}
