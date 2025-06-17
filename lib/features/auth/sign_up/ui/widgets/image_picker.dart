import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  final ImagePicker _picker = ImagePicker();
  bool _isPicking = false;

  Future<void> pickImageFromGallery() async {
    if (_isPicking) return; // Prevent re-entry
    setState(() {
      _isPicking = true;
    });

    try {
     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // context.read<SignUpCubit>().setDisabilityProofImage() = image;
        print('Image path: ${image.path}');
      } else {
        print('No image selected');
      }
    } catch (e) {
      print('Error picking image: $e');
    } finally {
      setState(() {
        _isPicking = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: pickImageFromGallery,
            child: const Icon(
              Icons.file_open_rounded,
              color: ColorsManager.mainBlue,
            ),
          ),
          horizontalSpace(5),
          Text(
            'Import a proof of disability card',
            style: TextStyles.font14darkGrayRegular,
          )
        ],
      ),
    );
  }
}
