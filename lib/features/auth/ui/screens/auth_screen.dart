import 'dart:math';

import 'package:adminportal/core/utils/extension_util.dart';
import 'package:adminportal/features/auth/ui/screens/welcome_screen.dart';
import 'package:adminportal/features/auth/ui/widgets/app_logo_header.dart';
import 'package:adminportal/navigation/custom_page_transition.dart';
import 'package:adminportal/resources/app_colors.dart';
import 'package:adminportal/resources/app_dimen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  static Page page({
    LocalKey? key,
  }) {
    return CustomPageTransition(
      key: key,
      transitionStyle: PageTransitionStyle.fade,
      child: const AuthScreen(),
    );
  }

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<ScaffoldState> _pageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double columnBreakPt = PageBreaks.tabletLandscape - 100;
    bool twoColumnMode = context.widthPx > columnBreakPt;
    //calculate how wide we want the panel, add extra width as it grows
    double contentWidth = twoColumnMode ? 300 : double.infinity;

    if (twoColumnMode) {
      double maxWidth = 700;
      contentWidth += min(maxWidth, context.widthPx * .15);
    }

    return Scaffold(
      key: _pageKey,
      backgroundColor: Colors.white,
      body: TweenAnimationBuilder<double>(
          duration: Durations.slow,
          tween: Tween(begin: 0, end: 1),
          builder: (_, value, __) {
            return Opacity(
              opacity: value,
              child: Center(
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    ////// //////// //////////
                    //show left pane on desktop screen
                    AnimatedPadding(
                      duration: Durations.slow,
                      curve: Curves.easeOut,
                      padding: EdgeInsets.only(
                        right: twoColumnMode ? contentWidth : 0,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        child: const AppLogoHeader(
                          color: AppColors.accent1,
                        ),
                      ),
                    ),
                    //// /////////////////////////////////
                    AnimatedPositioned(
                      duration: Durations.slow,
                      curve: Curves.easeOut,
                      top: 0.0,
                      bottom: 0.0,
                      right: 0.0,
                      left: twoColumnMode ? null : 0,
                      child: SizedBox(
                        width: contentWidth,
                        child: Center(
                          child: Scrollbar(
                            child: WelcomeScreen(
                              singleColumnMode: !twoColumnMode,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
