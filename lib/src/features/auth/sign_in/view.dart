import 'package:converse/src/features/auth/sign_in/sign_in.dart';
import 'package:converse/src/shared/values/values.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryElement,
      body: Center(
        child: Text('Sign in page'),
      ),
    );
  }
}
 