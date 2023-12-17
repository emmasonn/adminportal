import 'package:adminportal/resources/app_assets.dart';
import 'package:adminportal/resources/app_colors.dart';
import 'package:adminportal/resources/app_strings.dart';
import 'package:adminportal/resources/app_styles.dart';
import 'package:flutter/material.dart';

class AppLogoHeader extends StatelessWidget {
  const AppLogoHeader({
    super.key,
    this.color,
  });
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox.square(
          dimension: 200,
          child: ImageIcon(
            const AssetImage(AppAssets.adminIconPng),
            color: color ?? AppColors.onAccent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20.0,
            bottom: 20.0,
          ),
          child: Text(
            'Property Expects',
            textAlign: TextAlign.center,
            style: TextStyles.appTitle.copyWith(
              color: color ?? AppColors.onAccent,
            ),
          ),
        ),
      ],
    );
  }
}
