import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/core/routing/routes.dart';
import 'package:sanda/core/theming/colors.dart';
import 'package:sanda/core/theming/styles.dart';
import 'package:sanda/core/widgets/app_text_button.dart';
import 'package:sanda/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:sanda/features/auth/sign_up/ui/widgets/check_if_disabled.dart';
import 'package:sanda/features/auth/sign_up/ui/widgets/input_filed.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool imageSelected = false; // Tracks image selection

  Future<void> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    if (imageSelected) return; // Prevent re-entry

    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // Pass the selected image to the SignUpCubit
        context.read<SignUpCubit>().setDisabilityProofImage(image);
        setState(() {
          imageSelected = true;
        });
        print('Image path: ${image.path}');
      } else {
        print('No image selected');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
          child: BlocListener<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state is SignUpFailed) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              } else if (state is SignUpSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Create account Success")),
                );
                GoRouter.of(context).pushReplacement(Routes.loginScreen);
              }
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Account',
                    style: TextStyles.font24mainBlueBold.copyWith(height: 1.9),
                  ),
                  Text(
                    'Create your account and explore accessibility-focused features with ease! ',
                    style:
                        TextStyles.font14darkGrayRegular.copyWith(height: 1.6),
                  ),
                  verticalSpace(16),
                  const InputFiled(),
                  verticalSpace(5),
                  ValueListenableBuilder<bool>(
                    valueListenable:
                        context.read<SignUpCubit>().isDisabledNotifier,
                    builder: (context, value, child) {
                      print(value);
                      return const CheckIfDisabled();
                    },
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable:
                        context.read<SignUpCubit>().isDisabledNotifier,
                    builder: (context, value, child) {
                      return context
                              .read<SignUpCubit>()
                              .isDisabledNotifier
                              .value
                          ? GestureDetector(
                              onTap: pickImageFromGallery,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.file_open_rounded,
                                    color: imageSelected
                                        ? ColorsManager.mainBlue
                                        : ColorsManager
                                            .errorRed, // Color based on selection
                                  ),
                                  horizontalSpace(5),
                                  Text(
                                    imageSelected
                                        ? 'Image Selected'
                                        : 'Please select a proof of disability card',
                                    style: TextStyle(
                                      color: imageSelected
                                          ? ColorsManager.darkGray
                                          : ColorsManager.errorRed,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                  verticalSpace(16),
                  AppTextButton(
                    bottonText: "Create Account",
                    onPressed: () {
                      final isValid = context
                          .read<SignUpCubit>()
                          .formKey
                          .currentState!
                          .validate();
                      if (!isValid) {
                        if (context
                                .read<SignUpCubit>()
                                .isDisabledNotifier
                                .value ==
                            true) {
                          if (!imageSelected) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content:
                                    Text("Please select an image to proceed"),
                              ),
                            );
                          }
                        }
                        return;
                      } else {
                        context.read<SignUpCubit>().emitSignUp();
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}