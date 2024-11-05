import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/core/routing/routes.dart';
import 'package:sanda/features/on_bording/ui/on_bording_screen.dart';
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
      ],
    ),
  ],
);