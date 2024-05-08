import 'package:converse/src/features/navigation/app_navigator.dart';
import 'package:converse/src/features/navigation/routes.dart';
import 'package:converse/src/shared/shared.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 3200),
      () => AppNavigator.replaceAllNamed(HomeRoutes.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: theme.primary,
        ),
        child: Center(
          child: Text(
            'Converse .',
            style: TextStyle(
              color: theme.background,
              fontSize: 30.sp,
            ),
          ),
        ),
      ),
    );
  }
}
