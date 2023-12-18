import 'package:adminportal/core/helpers/spacer_widgets.dart';
import 'package:adminportal/core/widgets/app_text_field.dart';
import 'package:adminportal/core/widgets/custom_filled_button.dart';
import 'package:adminportal/navigation/app_screen_paths.dart';
import 'package:adminportal/resources/app_assets.dart';
import 'package:adminportal/resources/app_colors.dart';
import 'package:adminportal/resources/app_dimen.dart';
import 'package:adminportal/resources/app_strings.dart';
import 'package:adminportal/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatefulWidget {
  final bool singleColumnMode;
  const WelcomeScreen({
    super.key,
    this.singleColumnMode = false,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  //variable
  String? password;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Insets.lg,
      ),
      decoration: const BoxDecoration(
        color: AppColors.accent1,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Corners.md),
          bottomLeft: Radius.circular(Corners.md),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Insets.lg,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    if (widget.singleColumnMode) ...[
                      Hero(
                        tag: AppStrings.splashIconTagTxt,
                        child: Column(
                          children: [
                            const SizedBox.square(
                              dimension: 150,
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
                    ],
                    ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 400,
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Sign In',
                              textAlign: TextAlign.left,
                              style: TextStyles.t1.copyWith(
                                color: AppColors.onAccent,
                              ),
                            ),
                          ),
                          vSpacer(20.0),
                          AppTextFieldEx(
                            hintText: 'Email Address',
                            label: 'Email Address',
                            color: AppColors.onAccent,
                            style: TextStyles.body1
                                .copyWith(color: AppColors.onAccent),
                            onChanged: (value) {},
                          ),
                          vSpacer(10.0),
                          AppTextFieldEx(
                            hintText: 'Password ',
                            label: 'Password',
                            obscureText: true,
                            initialValue: password,
                            color: AppColors.onAccent,
                            maxLine: 1,
                            style: TextStyles.body1.copyWith(
                              color: AppColors.onAccent,
                            ),
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                          vSpacer(20.0),
                          SizedBox(
                            width: 240,
                            child: CustomFilledButton(
                              text: 'Sign In',
                              backgroudColor: AppColors.onAccent,
                              style: TextStyles.btnStyle.copyWith(
                                color: AppColors.accent1,
                              ),
                              onPressed: () {
                                GoRouter.of(context)
                                    .go(AppScreenPaths.dashboardPath);
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: Insets.lg,
              ),
              child: Text(
                'Privacy Policy',
                style: TextStyles.t3.copyWith(
                  color: AppColors.onAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
