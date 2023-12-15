import 'package:adminportal/navigation/app_router.dart';
import 'package:adminportal/resources/app_strings.dart';
import 'package:adminportal/resources/app_themes.dart';
import 'package:adminportal/resources/manager/theme_manager.dart';
import 'package:flutter/material.dart';

late ThemeManager themeManager;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //initialize themeManager
  themeManager = ThemeManager();

  runApp(const AdminPortalApp());
}

class AdminPortalApp extends StatelessWidget {
  const AdminPortalApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final themeManager = context.watch<ThemeManager>();
    return MaterialApp.router(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      locale: const Locale('en'),
      theme: AppTheme.fromType(ThemeType.none).toThemeData(),
      routerConfig: AppRouter.goRouter,
    );
  }
}
