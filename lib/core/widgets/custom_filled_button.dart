import 'package:adminportal/resources/app_colors.dart';
import 'package:adminportal/resources/app_dimen.dart';
import 'package:adminportal/resources/app_styles.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? backgroudColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? cornerRadius;
  final TextStyle? style;
  final double? height;
  final double? width;
  const CustomFilledButton(
      {Key? key,
      required this.text,
      this.prefixIcon,
      this.onPressed,
      this.suffixIcon,
      this.cornerRadius,
      this.backgroudColor,
      this.height,
      this.width,
      this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 46,
      width: width,
      child: MaterialButton(
        elevation: 0.0,
        color: backgroudColor ?? AppColors.accent1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            cornerRadius ?? Corners.vsm,
          ),
        ),
        onPressed: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (prefixIcon != null) ...[
              prefixIcon!,
            ],
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: style ??
                      TextStyles.btnStyle.copyWith(
                        color: AppColors.onAccent,
                      ),
                ),
              ),
            ),
            if (suffixIcon != null) ...[
              suffixIcon!,
            ]
          ],
        ),
      ),
    );
  }
}
