import 'package:converse/src/features/auth/sign_in/sign_in.dart';
import 'package:converse/src/shared/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum LoginType { google, facebook, apple, phone }

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLogo(),
          _buildThirdPartyLogin(LoginType.google),
          _buildThirdPartyLogin(LoginType.facebook),
          _buildThirdPartyLogin(LoginType.apple),
          _buildOrWidget(),
          _buildThirdPartyLogin(LoginType.phone),
          _buildSignUpText(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: 100.h, bottom: 80.h),
      child: Text(
        'Converse .',
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 34.sp,
        ),
      ),
    );
  }

  Widget _buildThirdPartyLogin(
    LoginType loginType,
  ) {
    return GestureDetector(
      onTap: () {
        loginType == LoginType.google
            ? controller.handleSignIn(LoginType.google)
            : loginType == LoginType.facebook
                ? debugPrint('login with facebook')
                : loginType == LoginType.apple
                    ? debugPrint('login with apple')
                    : debugPrint('login with phone number');
      },
      child: Container(
        width: 295.w,
        height: 44.h,
        padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 10.h),
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          color: AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            loginType == LoginType.phone
                ? const SizedBox.shrink()
                : Image.asset(
                    'assets/icons/${loginType == LoginType.google ? 'google.png' : loginType == LoginType.facebook ? 'facebook.png' : 'apple.png'}',
                    // scale: 5,
                  ),
            Text(
              loginType == LoginType.google
                  ? 'Sign in with Google'
                  : loginType == LoginType.facebook
                      ? 'Sign in with Facebook'
                      : loginType == LoginType.apple
                          ? 'Sign in with Apple'
                          : 'Sign in with phone number',
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30.h),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              indent: 50,
              height: 2.h,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
          const Text('   or   '),
          Expanded(
            child: Divider(
              endIndent: 50,
              height: 2.h,
              color: AppColors.primarySecondaryElementText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpText() {
    return Container(
      margin: EdgeInsets.only(top: 40.h),
      child: GestureDetector(
        onTap: () {
          print('Yoooooooo');
        },
        child: Column(
          children: [
            Text(
              'Already have an account?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryText,
                fontWeight: FontWeight.normal,
                fontSize: 12.sp,
              ),
            ),
            GestureDetector(
              child: Text(
                'Sign up here',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.primaryElement,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
