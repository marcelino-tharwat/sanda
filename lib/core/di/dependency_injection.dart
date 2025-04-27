import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sanda/core/networking/api_service.dart';
import 'package:sanda/core/networking/dio_factory.dart';
import 'package:sanda/features/auth/login/data/repo/login_repo.dart';
import 'package:sanda/features/auth/login/logic/login_cubit.dart';
import 'package:sanda/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:sanda/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:sanda/features/cart/data/repo/cart_repo.dart';
import 'package:sanda/features/cart/logic/cart_cubit.dart';
import 'package:sanda/features/home/data/repo/category_repo.dart';
import 'package:sanda/features/home/logic/category_cubit.dart';
import 'package:sanda/features/profile/data/repos/profile_data_repo.dart';
import 'package:sanda/features/profile/logic/cubit/adress/address_cubit.dart';
import 'package:sanda/features/profile/logic/cubit/profile_cubit/profile_data_cubit.dart';

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
  //profile
  getIt.registerLazySingleton<ProfileDataRepo>(
      () => ProfileDataRepo(apiService: getIt()));
  getIt.registerFactory<ProfileDataCubit>(() => ProfileDataCubit(getIt()));
  //Home category
  getIt.registerLazySingleton<CategoryRepo>(
      () => CategoryRepo(apiService: getIt()));
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt()));
  //cart
  getIt.registerLazySingleton<CartRepo>(() => CartRepo(apiService: getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));
  //address

}
