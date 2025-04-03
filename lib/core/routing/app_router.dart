import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/core/di/dependency_injection.dart';
import 'package:sanda/core/helper/app_constant.dart';
import 'package:sanda/core/routing/routes.dart';
import 'package:sanda/features/auth/forget_password/ui/forget_password_screen.dart';
import 'package:sanda/features/auth/login/logic/login_cubit.dart';
import 'package:sanda/features/auth/login/ui/login_screen.dart';
import 'package:sanda/features/auth/otp/ui/otp_screen.dart';
import 'package:sanda/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:sanda/features/on_bording/ui/on_bording_screen.dart';
import 'package:sanda/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:sanda/features/profile/data/models/user_profile_req.dart';
import 'package:sanda/features/profile/logic/profile_data_cubit.dart';
import 'package:sanda/features/profile/ui/profile_screen.dart';
import 'package:sanda/features/who_are_you/ui/who_are_you_screen.dart';
import 'package:sanda/navigation_menu.dart';

final GoRouter router = GoRouter(
  initialLocation: '',
  routes: <RouteBase>[
    //ON BORDING
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const OnBordingScreen();
      },
      routes: <RouteBase>[
        //WHO ARE YOU
        GoRoute(
          path: Routes.whoAreYouScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const WhoAreYouScreen();
          },
        ), //LOGIN SCREEN
        GoRoute(
          path: Routes.loginScreen,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => getIt<LoginCubit>(),
              child: const LoginScreen(),
            );
          },
        ), //SIGNUP SCREEN
        GoRoute(
          path: Routes.signUpScreen,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => getIt<SignUpCubit>(),
              child: const SignUpScreen(),
            );
          },
        ), //FORGET PASSWORD
        GoRoute(
          path: Routes.forgetPasswordScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const ForgetPasswordScreen();
          },
        ), //OTP SCREEN
        GoRoute(
          path: Routes.otpScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const OtpScreen();
          },
        ), //PROFRLE SCREEN
        GoRoute(
          path: Routes.profileScreen,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => getIt<ProfileDataCubit>()
                ..getProfileData(DataProfileRequest(userId), id: userId),
              child: const ProfileScreen(),
            );
          },
        ),
        GoRoute(
          path: Routes.navigationMenu,
          builder: (BuildContext context, GoRouterState state) {
            return const NavigationMenu();
          },
        ),
      ],
    ),
  ],
);
