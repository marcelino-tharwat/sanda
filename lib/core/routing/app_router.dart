import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sanda/features/on_bording/ui/on_bording_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const OnBordingScreen();
      },
    ),
  ],
);
