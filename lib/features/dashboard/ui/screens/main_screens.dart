import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  const MainScreen({
    super.key,
    required this.child,
  });
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
    );
  }
}
