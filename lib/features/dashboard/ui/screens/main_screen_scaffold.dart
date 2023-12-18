import 'package:adminportal/core/utils/enum_constants.dart';
import 'package:adminportal/core/utils/extension_util.dart';
import 'package:adminportal/features/dashboard/ui/provider/app_manager.dart';
import 'package:adminportal/features/dashboard/ui/widgets/main_drawer_widget.dart';
import 'package:adminportal/navigation/custom_page_transition.dart';
import 'package:adminportal/resources/app_colors.dart';
import 'package:adminportal/resources/app_dimen.dart';
import 'package:adminportal/resources/app_strings.dart';
import 'package:adminportal/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreenScaffold extends StatefulWidget {
  final Widget child;
  const MainScreenScaffold({
    super.key,
    required this.child,
  });
  static Page page({LocalKey? key, required Widget child}) {
    return CustomPageTransition(
      key: key,
      transitionStyle: PageTransitionStyle.fade,
      child: MainScreenScaffold(child: child),
    );
  }

  @override
  State<MainScreenScaffold> createState() => _MainScreenScaffoldState();
}

class _MainScreenScaffoldState extends State<MainScreenScaffold> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    final pageIndex = context.watch<AppManager>();
    final theme = Theme.of(context);

    //store screen type
    MainDrawerScreenTypes pageType = MainDrawerScreenTypes.none;
    ///////////// ////////////////////////
    double leftMenuWidth = Sizes.sideBarSm;
    bool compactMenuMode = true;

    if (context.widthPx >= PageBreaks.desktop) {
      leftMenuWidth = Sizes.sideBarLg;
      compactMenuMode = false;
    } else if (context.widthPx > PageBreaks.tabletLandscape) {
      leftMenuWidth = Sizes.sideBarMd;
    }

    bool isNarrow = context.widthPx < PageBreaks.tabletPortrait;

    //caclulate top bar height
    double topBarHeight = 60;
    double topBarPadding = isNarrow ? Insets.md : Insets.lg;

    //figure out what should be visible
    bool showDrawerPanel = !isNarrow;

    return Scaffold(
      key: scaffoldKey,
      drawer: !showDrawerPanel
          ? ConstrainedBox(
              constraints: BoxConstraints(maxWidth: Sizes.sideBarLg),
              child: const MainDrawerWidget(),
            )
          : null,
      body: Stack(
        children: [
          ///Header =
          AnimatedPositioned(
            duration: Durations.slow,
            curve: Curves.easeOut,
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 500),
              child: Stack(
                children: [
                  //// //////////////////////
                  /// INNER CONTENT STACK
                  Padding(
                    padding: EdgeInsets.only(
                      top: topBarHeight + topBarPadding,
                    ),
                    child: widget.child,
                    // MainScreen(
                    //   child: widget.child,
                    // ),
                  ),
                  //// ////////////////////////
                  /// HAMBURGER MENU BTN
                  Positioned(
                    left: Insets.md,
                    top: Insets.md,
                    child: IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        size: 24,
                        color: AppColors.accent1,
                      ),
                    ),
                  ),

                  //// /////////
                  ///App Title
                  if (isNarrow)
                    Padding(
                      padding: EdgeInsets.only(top: Insets.lg),
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          AppStrings.appNameTxt,
                          style: TextStyles.t2,
                        ),
                      ),
                    ),

                  ////  //////////
                  ///SEARCH BAR
                  Padding(
                    padding: EdgeInsets.only(
                      top: Insets.md,
                      right: Insets.md,
                    ),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: topBarHeight,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            color: AppColors.accent1,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          //// ////////////////////////////////
          /// LEFT MENU
          AnimatedPositioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: leftMenuWidth,
            duration: Durations.medium,
            curve: Curves.easeOut,
            child: Visibility(
              visible: showDrawerPanel,
              child: MainDrawerWidget(
                compactMode: compactMenuMode,
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
