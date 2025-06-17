import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/features/profile/logic/cubit/user_cubit/user_data_cubit.dart';
import '../../view_model/user_setting_view_model.dart';

class UserInfoSection extends StatelessWidget {
  final UserSettingViewModel viewModel;

  const UserInfoSection({super.key, required this.viewModel});

  // الخطوة 1: نقلنا الدالة إلى داخل الكلاس وجعلناها خاصة
  
ImageProvider _buildImageProvider(String? imagePath) {
  print("--- Building Image Provider ---");
  print("Received imagePath length: ${imagePath?.length}");

  if (imagePath == null || imagePath.isEmpty) {
    print("Decision: Path is null or empty. Using default asset.");
    return const AssetImage('assets/icons/profile-pic.jpg');
  }

  // ==== الشرط الجديد والمحسن ====
  // إذا كان المسار قصيرًا ويحتوي على '/'، فمن المحتمل جدًا أنه مسار ملف.
  // الطول 500 هو رقم آمن، سلاسل Base64 للصور تكون أطول بكثير.
  bool isLikelyFilePath = imagePath.contains('/') && imagePath.length < 500;

  if (isLikelyFilePath) {
    print("Decision: Path is likely a local file path. Using FileImage.");
    final file = File(imagePath);
    if (file.existsSync()) {
      return FileImage(file);
    } else {
      print("Error: File does not exist at path: $imagePath");
      return const AssetImage('assets/icons/profile-pic.jpg');
    }
  } 
  // إذا لم يكن مسار ملف، فهو بالتأكيد Base64
  else {
    print("Decision: Path is likely Base64 data. Attempting decode.");
    try {
      // إزالة أي بادئات قد يضيفها الخادم بالخطأ
      String sanitizedBase64 = imagePath.split(',').last;
      final decodedBytes = base64Decode(sanitizedBase64);

      if (decodedBytes.isNotEmpty) {
        print("Success: Base64 decoded successfully. Using MemoryImage.");
        return MemoryImage(decodedBytes);
      } else {
        print("Warning: Base64 decoded to empty bytes.");
        return const AssetImage('assets/icons/profile-pic.jpg');
      }
    } catch (e) {
      print("Error: Failed to decode Base64. Error: $e");
      return const AssetImage('assets/icons/profile-pic.jpg');
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDataCubit, UserDataState>(
      builder: (context, state) {
        if (state is UserDataLoading) {
          // يمكنك عرض دائرة رمادية أثناء التحميل لتبدو أفضل
          return Row(
            children: [
              const CircleAvatar(radius: 30, backgroundColor: Colors.grey),
              horizontalSpace(16),
              // ... يمكنك إضافة placeholders للنص أيضاً
            ],
          );
        } else if (state is UserDataSuccess) {
          final userState = state.userResponse;

          return Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.shade200, // لون خلفية احتياطي
                // الخطوة 3: استدعاء الدالة وتمرير مسار الصورة من الحالة
                backgroundImage: _buildImageProvider(userState.profilePicturePath),
              ),
              horizontalSpace(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${userState.firstName} ${userState.lastName}',
                      style: TextStyles.font16DarkGrayBold),
                  verticalSpace(4),
                  // استخدم الإيميل من حالة المستخدم مباشرة لضمان التحديث
                  Text(userState.email ?? viewModel.email, // استخدم الإيميل من الـ state إن وجد
                      style: TextStyles.font14GrayRegular),
                ],
              ),
            ],
          );
        } else {
          // في حالة الخطأ أو الحالة الأولية
          return Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/icons/profile-pic.jpg'),
              ),
              horizontalSpace(16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("User Name", style: TextStyles.font16DarkGrayBold),
                  verticalSpace(4),
                  Text(viewModel.email, style: TextStyles.font14GrayRegular),
                ],
              ),
            ],
          );
        }
      },
    );
  }
}