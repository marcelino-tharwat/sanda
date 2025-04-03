import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:sanda/features/profile/logic/profile_data_cubit.dart';

class ProfilePictureWidget extends StatefulWidget {
  final String? profilePicturePath;

  const ProfilePictureWidget({super.key, this.profilePicturePath});

  @override
  _ProfilePictureWidgetState createState() => _ProfilePictureWidgetState();
}

class _ProfilePictureWidgetState extends State<ProfilePictureWidget> {
  XFile? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _image = image; // تحديث الصورة المحددة
        });
        // إرسال الصورة المحددة إلى الـ cubit
        context.read<ProfileDataCubit>().updateProfileImage(image);
        print('Image path: ${image.path}');
      } else {
        print('No image selected');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Permission Denied. Please enable it in settings.'),
        ),
      );
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/right-side_logo.png',
          width: 90,
          height: 90,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error); // Fallback widget
          },
        ),
        Column(
          children: [
            Image.asset(
              'assets/images/upper_logo.png',
              width: 110,
              height: 110,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error); // Fallback widget
              },
            ),
            GestureDetector(
              onTap: _pickImage, // Trigger image picker when tapped
              child: ClipOval(
                child: checkImageIsFound(),
              ),
            ),
            Image.asset(
              'assets/images/Ellipse_3.2.png',
              width: 90,
              height: 90,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error); // Fallback widget
              },
            ),
          ],
        ),
        Image.asset(
          'assets/images/left_side_logo.png',
          width: 90,
          height: 90,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error); // Fallback widget
          },
        ),
      ],
    );
  }

  Widget checkImageIsFound() {
    // إذا كان هناك صورة تم اختيارها من المعرض
    if (_image != null) {
      return CircleAvatar(
        radius: 60,
        backgroundImage: FileImage(File(_image!.path)),
        backgroundColor: Colors.grey.shade300,
      );
    }
    // إذا كان هناك صورة في profilePicturePath وكان المسار صحيحًا
    else if (widget.profilePicturePath != null && widget.profilePicturePath!.isNotEmpty) {
      final file = File(widget.profilePicturePath!);
      if (file.existsSync()) { // التحقق من وجود الملف
        return CircleAvatar(
          radius: 60,
          backgroundImage: FileImage(file),
          backgroundColor: Colors.grey.shade300,
        );
      } else {
        print('File does not exist: ${widget.profilePicturePath}');
      }
    }
    // إذا لم يكن هناك صورة، عرض الصورة الافتراضية من assets
    return CircleAvatar(
      radius: 60,
      backgroundImage: const AssetImage('assets/images/splash.png'),
      backgroundColor: Colors.grey.shade300,
    );
  }
}