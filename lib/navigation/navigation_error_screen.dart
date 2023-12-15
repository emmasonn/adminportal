import 'package:adminportal/navigation/custom_page_transition.dart';
import 'package:adminportal/resources/app_styles.dart';
import 'package:flutter/material.dart';

class NavigationErrorScreen extends StatelessWidget {
  const NavigationErrorScreen({
    super.key,
    this.errorMsg,
  });
  final String? errorMsg;

  static Page page({LocalKey? key, String? errorMsg}) {
    return CustomPageTransition(
      key: key,
      transitionStyle: PageTransitionStyle.fade,
      child: NavigationErrorScreen(
        errorMsg: errorMsg ?? '',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Error'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          errorMsg!,
          style: TextStyles.body2,
        ),
      ),
    );
  }
}