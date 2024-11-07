import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/core/routing/routes.dart';
import 'package:sanda/features/auth/forget_password/ui/forget_password_screen.dart';
import 'package:sanda/features/auth/login/logic/login_cubit.dart';
import 'package:sanda/features/auth/login/ui/login_screen.dart';
import 'package:sanda/features/auth/otp/ui/otp_screen.dart';
import 'package:sanda/features/on_bording/ui/on_bording_screen.dart';
import 'package:sanda/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:sanda/features/who_are_you/ui/who_are_you_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const OnBordingScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: Routes.whoAreYouScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const WhoAreYouScreen();
          },
        ),
        GoRoute(
          path: Routes.loginScreen,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => LoginCubit(),
              child: const LoginScreen(),
            );
          },
        ),
        GoRoute(
          path: Routes.signUpScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpScreen();
          },
        ),
        GoRoute(
          path: Routes.forgetPasswordScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const ForgetPasswordScreen();
          },
        ),
        GoRoute(
          path: Routes.otpScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const OtpScreen();
          },
        ),
      ],
    ),
  ],
);
