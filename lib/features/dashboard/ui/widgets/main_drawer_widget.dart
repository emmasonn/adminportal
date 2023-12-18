import 'package:adminportal/core/helpers/spacer_widgets.dart';
import 'package:adminportal/features/dashboard/ui/widgets/main_drawer_item.dart';
import 'package:adminportal/resources/app_colors.dart';
import 'package:adminportal/resources/app_dimen.dart';
import 'package:adminportal/resources/app_strings.dart';
import 'package:adminportal/resources/app_styles.dart';
import 'package:flutter/material.dart';

class MainDrawerWidget extends StatefulWidget {
  const MainDrawerWidget({
    super.key,
    this.onPressed,
    this.compactMode = false,
  });
  final bool compactMode;
  final Function()? onPressed;

  @override
  State<MainDrawerWidget> createState() => _MainDrawerWidgetState();
}

class _MainDrawerWidgetState extends State<MainDrawerWidget> {
  double get _headerHeight => 106.0;
  double get _drawerItemHeight => 60.0;
  double get _indicatorHeight => 48.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        //////////////////////////////    //////////////////
        //* Header
        AnimatedContainer(
          height: _headerHeight,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeOut,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              //background Image
              Transform(
                transform: Matrix4.diagonal3Values(1.0, 1.2, 1.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(Corners.lg),
                    ),
                    color: theme.colorScheme.background,
                  ),
                ),
              ),
              //App Name
              Padding(
                padding: EdgeInsets.only(
                  bottom: Insets.sm,
                ),
                child: Text(
                  AppStrings.appNameTxt,
                  textAlign: TextAlign.center,
                  style: TextStyles.t1.copyWith(
                    height: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
        ///////////////////////
        ///MENU
        Expanded(
          child: Stack(
            children: [
              /// Menu-Background
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.accent1,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Corners.md),
                  ),
                ),
              ),

              ///Menu-buttons
              Container(
                padding: EdgeInsets.all(Insets.lg),
                constraints: const BoxConstraints(
                  maxWidth: 280,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(Corners.md),
                  ),
                ),
                child: Column(
                  children: [
                    vSpacer(Insets.lg),

                    /// Dashboard btn
                    MainDrawerItem(
                      const Icon(
                        Icons.dashboard,
                        size: 20.0,
                        color: AppColors.onAccent,
                      ),
                      AppStrings.dashboardTxt,
                      height: _drawerItemHeight,
                      compact: widget.compactMode,
                      onPressed: () {
                        widget.onPressed?.call();
                      },
                    ),

                    vSpacer(20.0),

                    /// Dashboard btn
                    MainDrawerItem(
                      const Icon(
                        Icons.contact_page,
                        size: 20.0,
                        color: AppColors.onAccent,
                      ),
                      AppStrings.contactsTxt,
                      height: _drawerItemHeight,
                      compact: widget.compactMode,
                      onPressed: () {
                        widget.onPressed?.call();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class AnimatedMenuIndicator extends StatelessWidget {
  final double indicatorY;
  final double width;
  final double height;

  const AnimatedMenuIndicator(
    this.indicatorY, {
    super.key,
    this.width = 6,
    this.height = 24,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(seconds: 5),
        curve: Curves.easeOutBack,
        width: width,
        height: height,
        margin: EdgeInsets.only(top: indicatorY),
        child: Container(
          color: Colors.white,
        ));
  }
}
