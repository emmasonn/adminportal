import 'package:adminportal/core/helpers/spacer_widgets.dart';
import 'package:adminportal/core/utils/enum_constants.dart';
import 'package:adminportal/resources/app_dimen.dart';
import 'package:adminportal/resources/app_styles.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class MainDrawerItem extends StatefulWidget {
  final Widget icon;
  final String label;
  final Function()? onPressed;
  final bool isSelected;
  final double iconSize;
  final bool compact;
  final bool transparent;
  final double height;
  final MainDrawerPageTypes pageType;
  final bool dottedBorder;

  const MainDrawerItem(
    this.icon,
    this.label, {
    Key? key,
    this.onPressed,
    this.isSelected = false,
    this.iconSize = 26,
    this.compact = false,
    this.transparent = false,
    this.height = 60,
    this.pageType = MainDrawerPageTypes.none,
    this.dottedBorder = false,
  }) : super(key: key);

  @override
  State<MainDrawerItem> createState() => _MainDrawerItemState();
}

class _MainDrawerItemState extends State<MainDrawerItem> {
  @override
  Widget build(BuildContext context) {
    Widget itemContent = AnimatedContainer(
      height: widget.height,
      duration: const Duration(milliseconds: 1000),
      child: Row(
        children: [
          if (!widget.compact) hSpacer(20),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: widget.icon,
          ),
          if (!widget.compact) ...{
            hSpacer(16.0),
            Expanded(
              child: Text(
                widget.label,
                style: TextStyles.btnStyle,
              ),
            ),
          }
        ],
      ),
    );

    itemContent = widget.dottedBorder
        ? DottedBorder(
            dashPattern: const [3, 5],
            color: Colors.white.withOpacity(.7),
            radius: const Radius.circular(Corners.sm),
            borderType: widget.compact ? BorderType.Circle : BorderType.RRect,
            child: Center(
              child: itemContent,
            ),
          )
        : itemContent;

    return MaterialButton(
      onPressed: widget.onPressed,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      elevation: 0,
      padding: EdgeInsets.zero,
      shape: widget.compact
          ? const CircleBorder()
          : const RoundedRectangleBorder(),
      child: itemContent,
    );
  }
}
