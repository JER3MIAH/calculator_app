import 'package:converse/src/features/auth/sign_in/sign_in.dart';
import 'package:converse/src/shared/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

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

  Widget _buildThirdPartyLogin(String loginType) {
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
          Image.asset(
            'assets/icons/google.png',
            // scale: 5,
          ),
          Text(
            'Sign in with Google',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySecondaryBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildLogo(),
          _buildThirdPartyLogin('Google'),
          _buildThirdPartyLogin('Facebook'),
          _buildThirdPartyLogin('Gmail'),
        ],
      ),
    );
  }
}
