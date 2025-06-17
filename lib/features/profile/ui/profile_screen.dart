import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/widgets/app_text_button.dart';
import 'package:sanda/features/profile/logic/cubit/user_cubit/user_data_cubit.dart';
import 'package:sanda/features/profile/ui/widgets/form_update_info.dart';
import 'package:sanda/features/profile/ui/widgets/profile_picture_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    // جلب البيانات عند فتح الشاشة
    context.read<UserDataCubit>().getUserData(id: 4);
  }

  void _saveChanges() {
    // استدعاء دالة الحفظ في الـ Cubit
    context.read<UserDataCubit>().updateUserData(4);
    // الخروج من وضع التعديل
    setState(() {
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('My Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocConsumer<UserDataCubit, UserDataState>(
          listener: (context, state) {
            if (state is UserDataFailed) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: Colors.red),
              );
            }
          },
          builder: (context, state) {
            // أثناء التحميل بعد الضغط على حفظ
            if (state is UserDataLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // في حالة النجاح أو عند عرض البيانات لأول مرة
            if (state is UserDataSuccess) {
              final user = state.userResponse;
              return RefreshIndicator(
                onRefresh: () async =>
                    context.read<UserDataCubit>().getUserData(id: 4),
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    verticalSpace(20),
                    // الويدجت سيعرض الصورة من المسار الذي يوفره الـ Cubit
                    ProfilePictureWidget(
                        profilePicturePath: user.profilePicturePath,
                        isEditing: _isEditing),
                    verticalSpace(40),
                    FormUpdateInfo(
                      isEditing: _isEditing,
                    ),
                    verticalSpace(50),
                    AppTextButton(
                      bottonText: _isEditing ? "Save Changes" : "Edit Profile",
                      onPressed: () {
                        if (_isEditing) {
                          _saveChanges();
                        } else {
                          setState(() {
                            _isEditing = true;
                          });
                        }
                      },
                    ),
                  ],
                ),
              );
            }
            // في حالة الخطأ أو الحالة الأولية
            return Center(
                child: Text(state is UserDataFailed
                    ? state.errorMessage
                    : "Pull to refresh."));
          },
        ),
      ),
    );
  }
}
