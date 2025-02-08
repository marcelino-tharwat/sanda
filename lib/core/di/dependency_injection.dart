import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sanda/core/networking/api_service.dart';
import 'package:sanda/core/networking/dio_factory.dart';
import 'package:sanda/features/auth/login/data/repo/login_repo.dart';
import 'package:sanda/features/auth/login/logic/login_cubit.dart';
import 'package:sanda/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:sanda/features/auth/sign_up/logic/sign_up_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  Dio dio = DioFactory.getDio();
  //api service
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //signup repo
  getIt
      .registerLazySingleton<SignUpRepo>(() => SignUpRepo(apiService: getIt()));
  getIt.registerFactory<SignUpCubit>(() => SignUpCubit(getIt()));
  //LOGIN
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(apiService: getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
