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

  
}
