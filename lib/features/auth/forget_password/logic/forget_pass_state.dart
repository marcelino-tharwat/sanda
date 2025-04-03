part of 'forget_pass_cubit.dart';

sealed class ForgetPassState {}

final class ForgetPassInitial extends ForgetPassState {}

final class ForgetPassLoading extends ForgetPassState {}

final class ForgetPassSuccess extends ForgetPassState {
  final EmailForgetPassResModel emailForgetPassResModel;

  ForgetPassSuccess({required this.emailForgetPassResModel});
}

final class ForgetPassFalled extends ForgetPassState {
  final String errorMessage;

  ForgetPassFalled({required this.errorMessage});
}
