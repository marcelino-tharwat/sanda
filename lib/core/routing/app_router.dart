import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/core/di/dependency_injection.dart';
import 'package:sanda/core/helper/app_constant.dart';
import 'package:sanda/core/routing/routes.dart';
import 'package:sanda/features/auth/forget_password/ui/forget_password_screen.dart';
import 'package:sanda/features/auth/login/data/models/login_res_model.dart';
import 'package:sanda/features/auth/login/logic/login_cubit.dart';
import 'package:sanda/features/auth/login/ui/login_screen.dart';
import 'package:sanda/features/auth/otp/ui/otp_screen.dart';
import 'package:sanda/features/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:sanda/features/auth/sign_up/ui/sign_up_screen.dart';
import 'package:sanda/features/home/logic/order/order_cubit.dart';
import 'package:sanda/features/on_bording/ui/on_bording_screen.dart';
import 'package:sanda/features/order/data/model/user_order_res_model.dart';
import 'package:sanda/features/order/ui/order_details_screen.dart';
import 'package:sanda/features/paymnet/data/logic/cubit/payment_cubit.dart';
import 'package:sanda/features/paymnet/ui/payment_method_screen.dart';
import 'package:sanda/features/profile/data/models/address_model.dart';
import 'package:sanda/features/profile/data/models/user_profile_req.dart';
import 'package:sanda/features/profile/logic/cubit/adress/address_cubit.dart';
import 'package:sanda/features/profile/logic/cubit/user_cubit/user_data_cubit.dart';
import 'package:sanda/features/profile/ui/choose_shipping_address.dart';
import 'package:sanda/features/profile/ui/profile_screen.dart';
import 'package:sanda/features/profile/ui/add_shipping_address_screen.dart';
import 'package:sanda/features/profile/user_settings/ui/user_setting_screen.dart';
import 'package:sanda/navigation_menu.dart';

final GoRouter router = GoRouter(
  initialLocation: '',
  routes: <RouteBase>[
    //ON BORDING
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const OnBordingScreen();
        // OnBordingScreen();
      },
      routes: <RouteBase>[
        //LOGIN SCREEN
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
            return BlocProvider.value(
              value: getIt<UserDataCubit>(),
              child: const ProfileScreen(),
            );
          },
        ),
        GoRoute(
          path: Routes.profileScreen,
          builder: (BuildContext context, GoRouterState state) {
            return const UserSettingScreen();
          },
        ),
        GoRoute(
          path: Routes.chooseShippingAddress,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => AddressCubit(),
              child: const ChooseShippingAddress(),
            );
          },
        ),
        GoRoute(
          path: Routes.orderDetailesScreen,
          pageBuilder: (context, state) {
            final order = state.extra as UserOrderResModel;
            return MaterialPage(
              child: BlocProvider.value(
                value: getIt<OrderCubit>(),
                child: OrderDetailesScreen(order: order),
              ),
            );
          },
        ),
        //ADD SHIPPING ADDRESS
        GoRoute(
          path: Routes.addShippingAddress,
          builder: (context, state) {
            final extra = state.extra;

            AddressCubit addressCubit;
            AddressModel? addressModel;

            if (extra != null && extra is Map<String, dynamic>) {
              addressCubit = extra['cubit'] as AddressCubit;
              addressModel = extra['address'] as AddressModel?;
            } else {
              addressCubit = AddressCubit();
              addressModel = null;
            }
            return BlocProvider.value(
              value: addressCubit,
              child: AddShippingAddressScreen(addressModel: addressModel),
            );
          },
        ),
        GoRoute(
          path: Routes.navigationMenu,
          builder: (BuildContext context, GoRouterState state) {
            final loginResponse = state.extra as LoginResModel;
            if (loginResponse == null) {
              // يمكنك عرض ويدجت خطأ هنا أو إعادة التوجيه
              return const Scaffold(
                body: Center(
                  child: Text('Error: Missing user data.'),
                ),
              );
            }
            return BlocProvider.value(
              value: getIt<UserDataCubit>()
                ..getUserData(id: loginResponse.userId),
              child: const NavigationMenu(),
            );
          },
        ),
        GoRoute(
          path: Routes.paymentMethodScreen,
          builder: (BuildContext context, GoRouterState state) {
            return BlocProvider(
              create: (context) => PaymentCubit()..getAllPaymentCard(),
              child: const PaymentMethodScreen(),
            );
          },
        ),
      ],
    ),
  ],
);
