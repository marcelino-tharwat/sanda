import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sanda/core/helper/app_constant.dart';
import 'package:sanda/features/profile/data/models/user_profile_req.dart';
import 'package:sanda/features/profile/data/models/user_res.dart';
import 'package:sanda/features/profile/data/repos/profile_data_repo.dart';

part 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  final ProfileDataRepo profileDataRepo;
  final formKey = GlobalKey<FormState>();

  final TextEditingController emialControlr = TextEditingController();
  final TextEditingController phoneControlr = TextEditingController();
  final TextEditingController firstNameControlr = TextEditingController();
  final TextEditingController lastNameControlr = TextEditingController();
  final TextEditingController ageControlr = TextEditingController();
  final TextEditingController addressControler = TextEditingController();
  XFile? profilePicturePath;

  // تخزين بيانات المستخدم الحالية
  UserResponse? userResponse;

  ProfileDataCubit(this.profileDataRepo) : super(ProfileDataInitial());

  Future<void> getProfileData(DataProfileRequest dataProfileRequest, {required int id}) async {
    emit(ProfileDataLoading());
    var response = await profileDataRepo.profileData(id: id);
    response.fold(
      (failure) => emit(ProfileDataFailed(errorMessage: failure.errorMessage)),
      (userResponse) {
        // تعيين القيم الأولية لـ TextEditingController
        firstNameControlr.text = userResponse.firstName ?? '';
        lastNameControlr.text = userResponse.lastName ?? '';
        emialControlr.text = userResponse.email ?? '';
        phoneControlr.text = userResponse.phoneNumber ?? '';
        addressControler.text = userResponse.address ?? '';
        ageControlr.text = userResponse.age?.toString() ?? '';
        
        // تخزين بيانات المستخدم الحالية
        this.userResponse = userResponse;
        emit(ProfileDataSuccess(userResponse: userResponse));
      },
    );
  }

  void updateProfileImage(XFile image) {
    profilePicturePath = image;
    // if (userResponse != null) {
    //   // تحديث مسار الصورة في userResponse
    //   userResponse = userResponse!.copyWith(profilePicturePath: image.path);
    //   emit(ProfileDataSuccess(userResponse: userResponse!)); // إعادة بناء الواجهة
    // }
  }

  Future<void> updateProfileData() async {
    emit(ProfileDataLoading());
    var response = await profileDataRepo.updateProfileData(
      id: userId,
      userResponse: UserResponse(
        firstName: firstNameControlr.text,
        lastName: lastNameControlr.text,
        phoneNumber: phoneControlr.text,
        email: emialControlr.text,
        address: addressControler.text,
        profilePicturePath: profilePicturePath?.path,
      ),
    );
    response.fold(
      (failure) => emit(ProfileDataFailed(errorMessage: failure.errorMessage)),
      (userResponse) {
        // تحديث بيانات المستخدم الحالية
        this.userResponse = userResponse;
        emit(ProfileDataSuccess(userResponse: userResponse));
      },
    );
  }
}