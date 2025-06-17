import 'package:sanda/features/favorite/data/model/fav_list_res_model.dart';

sealed class FavState {}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

// final class AddFavSuccess extends FavState {
//   final AddFavResModel favResModel;

//   AddFavSuccess({required this.favResModel});
// }

final class GetFavListSuccess extends FavState {
  final List<FavListResModel> favListResModel;

  GetFavListSuccess({required this.favListResModel});
}

final class DeleteFavSuccess extends FavState {
  final String message;

  DeleteFavSuccess({required this.message});
}

final class FavFailed extends FavState {
  final String errMessage;

  FavFailed({required this.errMessage});
}
