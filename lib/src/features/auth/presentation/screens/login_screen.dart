import 'package:converse/src/features/auth/presentation/widgets/lined_up_text.dart';
import 'package:converse/src/features/auth/presentation/widgets/start_aligned_text.dart';
import 'package:converse/src/features/navigation/app_navigator.dart';
import 'package:converse/src/features/navigation/routes.dart';
import 'package:converse/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class LoginScreen extends HookWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    return Scaffold(
      body: Form(
        key: formKey,
        onChanged: () {
          // viewmodel.onInputChanged(
          //   email: emailController.text.trim(),
          //   password: passwordController.text.trim(),
          // );
        },
        child: AppColumn(
          margin: EdgeInsets.symmetric(horizontal: 15.w).copyWith(top: 55.h),
          children: [
            const BackAndAppIcon(),
            YBox(15.h),
            StartAlignedText(
              text: 'Log in',
              style: TextStyle(
                height: 2,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            StartAlignedText(
              text: 'Provide your information below to get started',
              style: TextStyle(
                color: theme.secondary.withOpacity(0.6),
              ),
            ),
            YBox(30.h),
            AppTextField(
              controller: emailController,
              labelText: 'Email address',
              keyBoardType: TextInputType.emailAddress,
              validator: (value) {
                return Validator.nonEmptyField(value);
              },
            ),
            YBox(45.h),
            AppTextField(
              controller: passwordController,
              labelText: 'Password',
              isPasswordField: true,
              keyBoardType: TextInputType.visiblePassword,
              validator: (value) {
                return Validator.nonEmptyField(value);
              },
            ),
            YBox(25.h),
            LinedUpText(
              leadingText: 'Are you new here? ',
              trailingText: 'Register',
              isUndelined: true,
              onTapTrailing: () {
                AppNavigator.replaceNamed(AuthRoutes.signUp);
              },
            )
          ],
        ),
      ),
      bottomNavigationBar: AppColumn(
        height: 120.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        children: [
          AppButton(
            title: 'Log in',
            // isLoading: viewmodel.isLoading,
            onTap: () async {
              if (formKey.currentState!.validate()) {
                //TODO;
              }
            },
            buttonColor: theme.primary,
            // : theme.secondary.withOpacity(0.1),
          ),
          YBox(10.h),
          LinedUpText(
            leadingText: 'Forgot password? ',
            trailingText: 'Reset',
            onTapTrailing: () {
              emailController.clear();
              passwordController.clear();
              // AppNavigator.pushNamed(AuthRoutes.forgotPassword);
            },
          ),
        ],
      ),
    );
  }
}
