import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../splash_screen.dart';
import '../screens/dashboard/dashboard_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class Routes {
  static const String splashScreen = '/';
  static const String dashboardScreen = '/dashboard';

  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: splashScreen,
        name: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: dashboardScreen,
        name: dashboardScreen,
        builder: (context, state) => const DashboardScreen(),
      ),
    ],
  );
}
