import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sanda/config/cach_helper.dart';
import 'package:sanda/core/networking/api_service.dart';
import 'package:sanda/core/networking/dio_factory.dart';
import 'package:sanda/features/auth/login/data/repo/login_repo.dart';
import 'package:sanda/features/auth/login/logic/login_cubit.dart';
import 'package:sanda/features/auth/sign_up/data/repo/sign_up_repo.dart';
import 'package:sanda/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:sanda/features/cart/data/repo/cart_repo.dart';
import 'package:sanda/features/cart/logic/cart_cubit.dart';
import 'package:sanda/features/favorite/data/repo/fav_repo.dart';
import 'package:sanda/features/favorite/logic/fav_cubit.dart';
import 'package:sanda/features/home/data/repo/category_repo.dart';
import 'package:sanda/features/home/data/repo/order_repo.dart';
import 'package:sanda/features/home/logic/category/category_cubit.dart';
import 'package:sanda/features/home/logic/order/order_cubit.dart';
import 'package:sanda/features/profile/data/repos/profile_data_repo.dart';
import 'package:sanda/features/profile/logic/cubit/user_cubit/user_data_cubit.dart';

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
  getIt.registerLazySingleton<UserDataRepo>(
      () => UserDataRepo(apiService: getIt()));
  getIt.registerLazySingleton<UserDataCubit>(() => UserDataCubit(getIt()));
  //Home category
  getIt.registerLazySingleton<CategoryRepo>(
      () => CategoryRepo(apiService: getIt()));
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt()));
  //cart
  getIt.registerLazySingleton<CartRepo>(() => CartRepo(apiService: getIt()));
  getIt.registerFactory<CartCubit>(() => CartCubit(getIt()));
  //ORDER
  getIt.registerLazySingleton<OrderRepo>(() => OrderRepo(getIt()));
  getIt.registerFactory<OrderCubit>(() => OrderCubit(getIt()));

  //FAVORITE
  getIt.registerLazySingleton<FavRepo>(() => FavRepo(apiService: getIt()));
  getIt.registerFactory<FavCubit>(() => FavCubit(CacheHelper()));
}
