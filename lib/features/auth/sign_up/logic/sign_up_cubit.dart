import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final TextEditingController emialControlr = TextEditingController();
  final TextEditingController passwordControlr = TextEditingController();
  final TextEditingController phoneControlr = TextEditingController();
  final TextEditingController firstNameControlr = TextEditingController();
  final TextEditingController lastNameControlr = TextEditingController();
  final TextEditingController egyptianNationalIDController =
      TextEditingController();

  final TextEditingController passwordConfirmationControlr =
      TextEditingController();
  final formKey = GlobalKey<FormState>();
  SignUpCubit() : super(SignUpInitial());
}
