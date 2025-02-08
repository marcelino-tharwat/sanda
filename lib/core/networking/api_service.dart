import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sanda/core/networking/api_constant.dart';
import 'package:sanda/features/auth/login/data/models/login_req_model.dart';
import 'package:sanda/features/auth/login/data/models/login_res_model.dart';
import 'package:sanda/features/auth/sign_up/data/models/sign_up_req_model.dart';
import 'package:sanda/features/auth/sign_up/data/models/sign_up_res_model.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;
  //signup
  @POST(ApiConstant.signUp)
  Future<SignUpResModel> signUp(@Body() SignUpReqModel signUpReqModel);
  //login
  @POST(ApiConstant.login)
  Future<LoginResModel> login(@Body() LoginReqModel loginReqModel);
}
