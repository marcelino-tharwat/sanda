import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart'; // ضروري لـ kIsWeb
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/features/profile/logic/cubit/user_cubit/user_data_cubit.dart';

class ProfilePictureWidget extends StatelessWidget {
  final String? profilePicturePath;
  final bool isEditing;

  const ProfilePictureWidget(
      {super.key, this.profilePicturePath, required this.isEditing});

  Future<void> _pickImage(BuildContext context) async {
    try {
      final XFile? image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (image != null) {
        context.read<UserDataCubit>().updateProfileImage(image);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not pick image. Please check permissions.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  // هذه هي الدالة التي تم إصلاحها
  ImageProvider _buildImageProvider(BuildContext context) {
    final cubit = context.read<UserDataCubit>();

    // الحالة 1: المستخدم اختار صورة جديدة للتو (وهي ملف محلي)
    if (cubit.newProfileImage != null) {
      return FileImage(File(cubit.newProfileImage!.path));
    }

    final path = profilePicturePath;

    if (path != null && path.isNotEmpty) {
      try {
        // الحالة 2: محاولة فك تشفير السلسلة كـ base64
        // هذه هي الحالة عندما تأتي الصورة من الخادم
        final decodedBytes = base64Decode(path);
        return MemoryImage(decodedBytes);
      } catch (e) {
        // إذا فشل فك التشفير، فقد تكون السلسلة رابط URL أو مسار ملف
        // الحالة 3: التحقق مما إذا كان رابط ويب
        if (path.startsWith('http')) {
          return NetworkImage(path);
        }
        // الحالة 4: التحقق مما إذا كان مسار ملف (احتياطي)
        else if (path.startsWith('/')) {
          return FileImage(File(path));
        }
      }
    }

    // الحالة 5: لا توجد صورة، عرض الصورة الافتراضية
    return const AssetImage('assets/images/splash.png');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      buildWhen: (previous, current) => current is UserDataSuccess,
      builder: (context, state) {
        return Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey.shade200,
                // استدعاء الدالة الذكية الجديدة
                backgroundImage: _buildImageProvider(context),
              ),
              isEditing
                  ? Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () => _pickImage(context),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorsManager.mainBlue,
                          ),
                          child: const Icon(
                            LucideIcons.camera,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
