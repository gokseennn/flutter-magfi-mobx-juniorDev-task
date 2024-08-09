import 'package:flutter/material.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({super.key, required this.widget});
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: widget),
    );
  }
}
