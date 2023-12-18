import 'package:adminportal/features/dashboard/ui/provider/app_manager.dart';
import 'package:adminportal/navigation/app_router.dart';
import 'package:adminportal/resources/app_strings.dart';
import 'package:adminportal/resources/app_themes.dart';
import 'package:adminportal/resources/manager/theme_manager.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

late ThemeManager themeManager;
late AppManager appManager;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //initialize ThemeManager
  themeManager = ThemeManager();
  //initilize AppManager
  appManager = AppManager();

  /// Set minimal Window size
  DesktopWindow.setMinWindowSize(const Size(750, 600));

  runApp(const AdminPortalApp());
}

class AdminPortalApp extends StatelessWidget {
  const AdminPortalApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final themeManager = context.watch<ThemeManager>();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: appManager,
        ),
        ChangeNotifierProvider.value(
          value: themeManager,
        ),
      ],
      child: MaterialApp.router(
        title: AppStrings.appNameTxt,
        debugShowCheckedModeBanner: false,
        locale: const Locale('en'),
        theme: AppTheme.fromType(ThemeType.none).toThemeData(),
        routerConfig: AppRouter.goRouter,
      ),
    );
  }
}
