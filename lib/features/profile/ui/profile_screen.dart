import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanda/core/helper/spacer.dart';
import 'package:sanda/features/profile/logic/cubit/profile_cubit/profile_data_cubit.dart';
import 'package:sanda/features/profile/ui/widgets/form_update_info.dart';
import 'package:sanda/features/profile/ui/widgets/profile_picture_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<ProfileDataCubit, ProfileDataState>(
          buildWhen: (previous, current) =>
              current is ProfileDataLoading ||
              current is ProfileDataSuccess ||
              current is ProfileDataFailed,
          builder: (context, state) {
            if (state is ProfileDataLoading) {
              return const CircularProgressIndicator();
            } else if (state is ProfileDataSuccess) {
              var userResponseModel = state.userResponse;
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    verticalSpace(20),
                    ProfilePictureWidget(
                        profilePicturePath:
                            userResponseModel.profilePicturePath),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: FormUpdateInfo(
                        userResponseModel: userResponseModel,
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is ProfileDataFailed) {
              return Text(state.errorMessage);
            } else {
              return const Text("No data available.");
            }
          },
        ),
      ),
    );
  }
}
