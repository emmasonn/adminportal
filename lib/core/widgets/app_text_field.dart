import 'package:adminportal/resources/app_colors.dart';
import 'package:adminportal/resources/app_dimen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFieldEx extends StatefulWidget {
  const AppTextFieldEx({
    Key? key,
    required this.hintText,
    this.controller,
    this.height,
    this.style,
    this.prefixIcon,
    this.hintIcon,
    this.suffixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType,
    this.validator,
    this.formatter,
    this.obscureText,
    this.isEditable,
    this.outline,
    this.elevate,
    this.helperText,
    this.initialValue,
    this.label,
    this.maxLine,
    this.fontSize,
    this.onSuffixClicked,
    this.color,
    this.inputAction,
    required this.onChanged,
  }) : super(key: key);
  final TextEditingController? controller;
  final String hintText;
  final double? height;
  final TextInputAction? inputAction;
  final TextStyle? style;
  final double? fontSize;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Widget? hintIcon;
  final List<TextInputFormatter>? formatter;
  final String? label;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final bool? isEditable;
  final bool? elevate;
  final bool? outline;
  final String? helperText;
  final String? initialValue;
  final Function(String?) onChanged;
  final Function()? onSuffixClicked;
  final int? maxLine;
  final Color? color;

  @override
  State<AppTextFieldEx> createState() => _AppTextFieldExState();
}

class _AppTextFieldExState extends State<AppTextFieldEx> {
  final TextEditingController _controller = TextEditingController();
  String? currentValue;
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText ?? false;
    _controller.text = widget.initialValue ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null && widget.label!.isNotEmpty) ...[
          Text(
            widget.label!,
            style: widget.style?.copyWith(
              fontSize: FontSizes.s14,
            ),
          ),
          //vertical spacer
          const SizedBox(
            height: 5,
          ),
        ],
        SizedBox(
          height: 50.0,
          child: TextFormField(
            controller: _controller,
            style: widget.style?.copyWith(
              fontSize: FontSizes.s12,
              fontWeight: FontWeight.w400,
            ),
            enabled: widget.isEditable,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            autocorrect: false,
            inputFormatters: widget.formatter,
            textInputAction: widget.inputAction,
            maxLines: widget.maxLine,
            obscureText: obscureText,
            cursorColor: widget.color,
            decoration: InputDecoration(
              fillColor: AppColors.onAccent,
              contentPadding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 0,
                bottom: 0,
              ),
              prefixIcon: widget.prefixIcon,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.greyLight,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(Corners.sm),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.greyLight, width: 1.2),
                borderRadius: BorderRadius.circular(Corners.sm),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.greyLight,
                  width: 1.2,
                ),
                borderRadius: BorderRadius.circular(Corners.sm),
              ),
              helperText: widget.helperText,
              hintText: widget.hintText,
              hintStyle: widget.style?.copyWith(
                fontStyle: FontStyle.italic,
                fontSize: FontSizes.s12,
                color: AppColors.greyColor,
              ),
              suffixIcon: widget.suffixIcon != null
                  ? InkWell(
                      splashColor: AppColors.accent1.withOpacity(0.1),
                      onTap: widget.onSuffixClicked,
                      child: widget.suffixIcon,
                    )
                  : widget.obscureText != null
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: obscureText
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility),
                          color: AppColors.greyColor,
                          iconSize: 20,
                        )
                      : null,
            ),
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
