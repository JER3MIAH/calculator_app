import 'package:converse/src/features/welcome/welcome.dart';
import 'package:converse/src/shared/values/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends GetView<WelcomeController> {
  const WelcomeScreen({super.key});

  Widget _buildPageHeadTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.primaryElementText,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 45,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _buildPageHeadTitle(controller.title),
      ),
    );
  }
}
