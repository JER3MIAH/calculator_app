import 'package:converse/src/features/auth/sign_in/sign_in.dart';
import 'package:converse/src/shared/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum LoginTypye { google, facebook, apple, phone }

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
          _buildThirdPartyLogin(LoginTypye.google),
          _buildThirdPartyLogin(LoginTypye.facebook),
          _buildThirdPartyLogin(LoginTypye.apple),
          _buildOrWidget(),
          _buildThirdPartyLogin(LoginTypye.phone),
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
    LoginTypye loginType,
  ) {
    return Container(
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
          loginType == LoginTypye.phone
              ? const SizedBox.shrink()
              : Image.asset(
                  'assets/icons/${loginType == LoginTypye.google ? 'google.png' : loginType == LoginTypye.facebook ? 'facebook.png' : 'apple.png'}',
                  // scale: 5,
                ),
          Text(
            loginType == LoginTypye.google
                ? 'Sign in with Google'
                : loginType == LoginTypye.facebook
                    ? 'Sign in with Facebook'
                    : loginType == LoginTypye.apple
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
    );
  }
}
