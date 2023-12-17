import 'package:adminportal/core/widgets/constrained_flex_widget.dart';
import 'package:adminportal/navigation/custom_page_transition.dart';
import 'package:adminportal/resources/app_styles.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static Page page({
    LocalKey? key,
  }) {
    return CustomPageTransition(
      key: key,
      transitionStyle: PageTransitionStyle.fade,
      child: const DashboardScreen(),
    );
  }

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GlobalKey<ScaffoldState> _pageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ConstrainedFlexWidget(
      850,
      key: _pageKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Dashboard Page',
            style: TextStyles.h2,
          ),
        ],
      ),
    );
  }
}
