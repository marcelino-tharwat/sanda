import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sanda/features/profile/data/models/user_res.dart';
import 'dart:io';
import 'dart:convert';

import 'package:sanda/features/profile/data/repos/profile_data_repo.dart';
part 'user_data_state.dart';

class UserDataCubit extends Cubit<UserDataState> {
  final UserDataRepo profileDataRepo;
  final formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  XFile? newProfileImage;
  int? userId;

  UserDataCubit(this.profileDataRepo) : super(UserDataInitial());

  Future<void> getUserData({required int id}) async {
    emit(UserDataLoading());
    userId = id;

    var response = await profileDataRepo.profileData(id: id);
    response.fold(
      (failure) => emit(UserDataFailed(errorMessage: failure.errorMessage)),
      (userResponse) {
        firstNameController.text = userResponse.firstName ?? '';
        lastNameController.text = userResponse.lastName ?? '';
        emailController.text = userResponse.email ?? '';
        phoneController.text = userResponse.phoneNumber ?? '';
        addressController.text = userResponse.address ?? '';
        ageController.text = userResponse.age?.toString() ?? '';
        newProfileImage = null;

        emit(UserDataSuccess(userResponse: userResponse));
      },
    );
  }

  void updateProfileImage(XFile image) {
    newProfileImage = image;

    // نتأكد أن الحالة الحالية هي نجاح وتحمل بيانات المستخدم
    if (state is UserDataSuccess) {
      // نأخذ بيانات المستخدم الحالية
      final currentUserResponse = (state as UserDataSuccess).userResponse;
      // ننشئ نسخة جديدة من البيانات مع تحديث مسار الصورة (للعرض فقط في الواجهة)
      final updatedUserResponse = currentUserResponse.copyWith(
        profilePicturePath: image.path,
      );
      // نُصدر الحالة الجديدة لكي تعيد الواجهة بناء نفسها بالصورة الجديدة
      emit(UserDataSuccess(userResponse: updatedUserResponse));
    }
  }

  Future<void> updateUserData(int userId) async {
    // 1. نتأكد أننا في حالة تسمح بالحفظ
    if (state is! UserDataSuccess) return;

    // 2. نلتقط ونحفظ بيانات حالة النجاح الحالية في متغير محلي
    final previousSuccessState = state as UserDataSuccess;

    // 3. الآن، وبعد أن حفظنا البيانات، يمكننا تغيير الحالة إلى "تحميل" بأمان
    emit(UserDataLoading());

    String? imageToSend;

    // 4. نتحقق إذا كان هناك صورة جديدة تم اختيارها
    if (newProfileImage != null) {
      final bytes = await File(newProfileImage!.path).readAsBytes();
      imageToSend = base64Encode(bytes);
    } else {
      // 5. إذا لم تكن هناك صورة جديدة، نستخدم الصورة القديمة من الحالة التي حفظناها
      final currentImage = previousSuccessState.userResponse.profilePicturePath;
      // هذا الشرط للتحقق أن الصورة الحالية ليست مسارًا محليًا مؤقتًا
      if (currentImage != null && !currentImage.startsWith('/')) {
        imageToSend = currentImage;
      }
    }

    var response = await profileDataRepo.updateProfileData(
      id: userId,
      userResponse: UserResponse(
        id: userId,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        phoneNumber: phoneController.text,
        email: emailController.text,
        address: addressController.text,
        profilePicturePath: imageToSend, // إرسال الصورة الصحيحة
      ),
    );

    response.fold(
      // في حالة الفشل، نعود إلى الحالة السابقة مع رسالة الخطأ
      (failure) => emit(UserDataFailed(errorMessage: failure.errorMessage)),
      // في حالة النجاح، نعيد جلب البيانات المحدثة من الخادم
      (userResponse) {
        getUserData(id: userId);
      },
    );
  }
}
