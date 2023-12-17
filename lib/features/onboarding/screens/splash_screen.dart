import 'package:adminportal/core/animation/fade_animation_ex.dart';
import 'package:adminportal/navigation/app_screen_paths.dart';
import 'package:adminportal/navigation/custom_page_transition.dart';
import 'package:adminportal/resources/app_assets.dart';
import 'package:adminportal/resources/app_colors.dart';
import 'package:adminportal/resources/app_strings.dart';
import 'package:adminportal/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static Page page({LocalKey? key}) {
    return CustomPageTransition(
      key: key,
      transitionStyle: PageTransitionStyle.fade,
      child: const SplashScreen(),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoAnimController;

  //loading Condition
  bool initializing = false;

  @override
  void initState() {
    super.initState();

    _logoAnimController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        _logoAnimController.forward();
      });
      //navigate to auhentication screen after 3 seconds
      Future.delayed(const Duration(seconds: 4), () {
        GoRouter.of(context).go(
          AppScreenPaths.authPath,
        );
      });
    });
  }

  @override
  void dispose() {
    _logoAnimController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.accent1,
      body: SafeArea(
        bottom: false,
        top: false,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            // Positioned(
            //   left: 0,
            //   right: 0,
            //   bottom: 0,
            //   child: Container(
            //     width: size.width,
            //     height: size.height,
            //     decoration: const BoxDecoration(
            //       image: DecorationImage(
            //         image: AssetImage(
            //           AppAssets.splashBg,
            //         ),
            //         fit: BoxFit.cover,
            //       ),
            //     ),
            //   ),
            // ),
            FadeAnimationEx(
              animationController: _logoAnimController,
              child: Center(
                child: Hero(
                  tag: AppStrings.splashIconTagTxt,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox.square(
                        dimension: 200,
                        child: ImageIcon(
                          AssetImage(AppAssets.adminIconPng),
                          color: AppColors.onAccent,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 20.0,
                        ),
                        child: Text(
                          'Property Expects',
                          textAlign: TextAlign.center,
                          style: TextStyles.t1.copyWith(
                            color: AppColors.onAccent,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
