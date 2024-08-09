import 'package:flutter/material.dart';

class CommonScreen extends StatelessWidget {
  const CommonScreen({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: body),
    );
  }
}
