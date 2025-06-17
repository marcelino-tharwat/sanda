// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:sanda/features/favorite/data/model/add_fav_res_model.dart';
// import 'package:sanda/features/favorite/data/model/fav_list_res_model.dart';
// import 'package:sanda/features/favorite/data/repo/fav_repo.dart';

// part 'fav_state.dart';

// class FavCubit extends Cubit<FavState> {
//   final FavRepo favRepo;
//   FavCubit(this.favRepo) : super(FavInitial());

//   Future<void> addFavService({
//     required int userId,
//     required int productId,
//   }) async {
//     emit(FavLoading());
//     var response =
//         await favRepo.addFavService(userId: userId, productId: productId);
//     response.fold(
//       (failer) {
//         emit(FavFailed(errMessage: failer.errorMessage));
//       },
//       (favResModel) {
//         emit(AddFavSuccess(favResModel: favResModel));
//       },
//     );
//   }

//   Future<void> getUserFavServices({
//     required int userId,
//   }) async {
//     emit(FavLoading());
//     var response = await favRepo.getUserFavServices(userId: userId);
//     response.fold(
//       (failer) {
//         emit(FavFailed(errMessage: failer.errorMessage));
//       },
//       (favListResModel) {
//         emit(GetFavListSuccess(favListResModel: favListResModel));
//       },
//     );
//   }

//   Future<void> deleteFavService({
//     required int userId,
//     required int productId,
//   }) async {
//     emit(FavLoading());
//     var response =
//         await favRepo.deleteFavService(userId: userId, productId: productId);
//     response.fold(
//       (failer) {
//         emit(FavFailed(errMessage: failer.errorMessage));
//       },
//       (message) {
//         emit(DeleteFavSuccess(message: message));
//       },
//     );
//   }
// }
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanda/config/cach_helper.dart';
import 'package:sanda/features/favorite/data/model/fav_list_res_model.dart';
import 'package:sanda/features/favorite/data/repo/fav_repo.dart';
import 'package:sanda/features/favorite/logic/fav_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavCubit extends Cubit<List<FavListResModel>> {
  final CacheHelper _cacheHelper;

  FavCubit(this._cacheHelper) : super([]) {
    loadFavorites();
  }
  Future<void> loadFavorites() async {
    // ببساطة نستدعي دالتك الجاهزة
    final favoritesList = await _cacheHelper.getFavList();
    emit(favoritesList);
  }

  Future<void> toggleFavoriteStatus(FavListResModel serviceToToggle) async {
    final currentFavorites = List<FavListResModel>.from(state);

    // --- التغيير الحاسم هنا ---
    // ابحث باستخدام serviceId بدلاً من id
    final index = currentFavorites
        .indexWhere((s) => s.serviceId == serviceToToggle.serviceId);

    if (index != -1) {
      // إذا وجدته، احذفه
      currentFavorites.removeAt(index);
    } else {
      // إذا لم تجده، أضفه
      currentFavorites.add(serviceToToggle);
    }

    await _cacheHelper.saveFavorites(currentFavorites);
    emit(currentFavorites);
  }

  bool isFavorite(int serviceId) {
    // استخدم serviceId للبحث
    return state.any((service) => service.serviceId == serviceId);
  }
}
