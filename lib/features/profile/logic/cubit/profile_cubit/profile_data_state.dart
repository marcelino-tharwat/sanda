part of 'profile_data_cubit.dart';

sealed class ProfileDataState {}

final class ProfileDataInitial extends ProfileDataState {}

final class ProfileDataLoading extends ProfileDataState {}

final class ProfileDataSuccess extends ProfileDataState {
  final UserResponse userResponse;

  ProfileDataSuccess({required this.userResponse});
}

final class ProfileDataFailed extends ProfileDataState {
  final String errorMessage;

  ProfileDataFailed({required this.errorMessage});
}
