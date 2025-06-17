part of 'user_data_cubit.dart';

sealed class UserDataState {}

final class UserDataInitial extends UserDataState {}

final class UserDataLoading extends UserDataState {}

final class UserDataSuccess extends UserDataState {
  final UserResponse userResponse;

  UserDataSuccess({required this.userResponse});
}

final class UserDataFailed extends UserDataState {
  final String errorMessage;

  UserDataFailed({required this.errorMessage});
}
