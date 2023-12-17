import 'package:adminportal/features/auth/ui/screens/auth_screen.dart';
import 'package:adminportal/features/dashboard/ui/screens/constacts_screen.dart';
import 'package:adminportal/features/dashboard/ui/screens/dashboard_screen.dart';
import 'package:adminportal/features/dashboard/ui/screens/main_screen_scaffold.dart';
import 'package:adminportal/features/onboarding/screens/splash_screen.dart';
import 'package:adminportal/navigation/app_router.dart';
import 'package:adminportal/navigation/app_screen_paths.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutes {
  static final splashScreen = GoRoute(
    parentNavigatorKey: rootNavigator,
    path: AppScreenPaths.splashPath,
    pageBuilder: (BuildContext context, state) {
      return SplashScreen.page(key: state.pageKey);
    },
  );

  static final authScreen = GoRoute(
    parentNavigatorKey: rootNavigator,
    path: AppScreenPaths.authPath,
    pageBuilder: (BuildContext context, state) {
      return AuthScreen.page(key: state.pageKey);
    },
  );

  static final mainScaffoldScreen = ShellRoute(
    navigatorKey: shellNavigator,
    pageBuilder: (context, state, child) {
      return MainScreenScaffold.page(
        key: state.pageKey,
        child: child,
      );
    },
    routes: [
      dashboardScreen,
      contactsScreen,
    ],
  );

  static final dashboardScreen = GoRoute(
    path: AppScreenPaths.dashboardPath,
    pageBuilder: (context, state) {
      return DashboardScreen.page(key: state.pageKey);
    },
  );

  static final contactsScreen = GoRoute(
    path: AppScreenPaths.contactsPath,
    pageBuilder: (context, state) {
      return ContactsScreen.page(key: state.pageKey);
    },
  );
}
