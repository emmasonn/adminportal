import 'package:adminportal/main.dart';
import 'package:adminportal/navigation/app_screen_paths.dart';
import 'package:adminportal/navigation/navigation_error_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigator = GlobalKey(debugLabel: 'shell');

class AppRouter {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppScreenPaths.splashPath,
    redirect: (context, state) {
      return null;
    },
    navigatorKey: rootNavigator,
    refreshListenable: themeManager,
    errorPageBuilder: (context, state) => NavigationErrorScreen.page(
      key: state.pageKey,
      errorMsg: state.error?.message,
    ),
    routes: <RouteBase>[
      
    ],
  );
}
