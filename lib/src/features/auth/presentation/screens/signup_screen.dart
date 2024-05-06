import 'package:converse/src/features/auth/logic/providers/signup_provider.dart';
import 'package:converse/src/features/navigation/app_navigator.dart';
import 'package:converse/src/features/navigation/routes.dart';
import 'package:converse/src/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widgets/widgets.dart';

class SignUpScreen extends HookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final theme = Theme.of(context).colorScheme;
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final userNameController = useTextEditingController();
    final confirmPasswordController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final signupProvider = ref.watch(signUpProvider);

    return Scaffold(
      body: Form(
        key: formKey,
        onChanged: () {
          signupProvider.onInputChanged(
            firstName: userNameController.text.trim(),
            email: emailController.text.trim(),
            phoneNumber: confirmPasswordController.text.trim(),
            password: passwordController.text.trim(),
          );
        },
        child: AppColumn(
          margin: EdgeInsets.symmetric(horizontal: 15.w).copyWith(top: 55.h),
          shouldScroll: true,
          children: [
            const BackAndAppIcon(),
            YBox(30.h),
            StartAlignedText(
              text: 'Sign Up',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            StartAlignedText(
              text: 'Provide your information below to get started',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: theme.secondary,
              ),
            ),
            YBox(20.h),
            AppTextField(
              controller: userNameController,
              labelText: 'Username',
              keyBoardType: TextInputType.name,
              validator: (value) {
                return Validator.nonEmptyField(value);
              },
            ),
            YBox(35.h),
            AppTextField(
              controller: emailController,
              labelText: 'Email address',
              keyBoardType: TextInputType.emailAddress,
              validator: (value) {
                return Validator.emailValidator(value);
              },
            ),
            YBox(35.h),
            AppTextField(
              controller: passwordController,
              labelText: 'Password',
              keyBoardType: TextInputType.visiblePassword,
              isPasswordField: true,
              validator: (value) {
                return Validator.password(value);
              },
            ),
            YBox(35.h),
            AppTextField(
              controller: confirmPasswordController,
              labelText: 'Confirm password',
              keyBoardType: TextInputType.visiblePassword,
              isPasswordField: true,
              validator: (value) {
                return Validator.confrimPassword(
                    value, passwordController.text);
              },
            ),
            YBox(45.h),
            AppButton(
              title: 'Next',
              isLoading: signupProvider.isLoading,
              onTap: () async {},
              buttonColor: theme.primary,
              //  signupViewmodel.buttonEnabled
              //     ? theme.primary
              //     : theme.secondary,
            ),
            YBox(27.h),
            LinedUpText(
              leadingText: 'Already have an account? ',
              trailingText: 'Log in',
              isUndelined: true,
              onTapTrailing: () {
                signupProvider.disposeValues();
                AppNavigator.replaceNamed(AuthRoutes.login);
              },
            ),
            YBox(35.h),
          ],
        ),
      ),
    );
  }
}
