import 'package:flutter/material.dart';

class ConstrainedFlexWidget extends StatelessWidget {
  final Widget child;
  final double minSize;
  final Axis axis;
  final EdgeInsets scrollPadding;
  const ConstrainedFlexWidget(
    this.minSize, {
    super.key,
    required this.child,
    this.axis = Axis.vertical,
    this.scrollPadding = const EdgeInsets.all(0),
  });

  bool get isHoriz => axis == Axis.horizontal;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (_, constraints) {
        double viewSize =
            isHoriz ? constraints.maxWidth : constraints.maxHeight;

        if (viewSize > minSize) return child;

        return Padding(
          padding: scrollPadding,
          child: Container(
            width: double.infinity,
            color: theme.colorScheme.background,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: isHoriz ? double.infinity : minSize,
                maxWidth: isHoriz ? minSize : double.infinity,
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
