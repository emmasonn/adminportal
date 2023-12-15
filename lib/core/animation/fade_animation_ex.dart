import 'package:flutter/material.dart';

enum SlideDirection { fromTop, fromLeft, fromRight, fromBottom }

class FadeAnimationEx extends StatefulWidget {
  final Widget? child;
  final AnimationController? animationController;

  const FadeAnimationEx({
    Key? key,
    required this.animationController,
    required this.child,
  }) : super(key: key);

  @override
  State<FadeAnimationEx> createState() => _FadeAnimationExState();
}

class _FadeAnimationExState extends State<FadeAnimationEx> {
  @override
  Widget build(BuildContext context) {
    // we need to declare our animation for fade transition widget
    var animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: widget.animationController!,
      // curve for the way you want to animate your widget you can use anything from curves
      curve: const Interval(0, 1.0, curve: Curves.fastOutSlowIn),
    ));

    // widget.animationController!.forward();

    return AnimatedBuilder(
      animation: widget.animationController!,
      builder: (context, child) {
        return FadeTransition(
          opacity: animation,
          child: widget.child,
        );
      },
    );
  }
}
