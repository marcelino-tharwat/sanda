part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  LoginResModel loginResModel;
  LoginSuccess({required this.loginResModel});
  
}

final class LoginError extends LoginState {
  String errorMessage;
  LoginError(this.errorMessage);
}
