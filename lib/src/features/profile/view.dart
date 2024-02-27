import 'package:converse/src/features/profile/profile.dart';
import 'package:converse/src/shared/values/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.primaryElement,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _buildProfilePhoto(),
                  _buildButton(false),
                  _buildButton(true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(bool isLogoutButton) {
    return GestureDetector(
      onTap: () {
        if (isLogoutButton) {
          Get.defaultDialog(
            titleStyle: TextStyle(fontSize: 20.sp),
            backgroundColor: Colors.white,
            title: 'Are you sure you want to log out?',
            textConfirm: 'Confirm',
            textCancel: 'Cancel',
            confirmTextColor: Colors.white,
            content: Container(),
            onConfirm: () {
              controller.logout();
            },
            onCancel: () {},
          );
        }
      },
      child: Container(
        width: 295.w,
        height: 44.h,
        margin: EdgeInsets.only(bottom: isLogoutButton ? 0.h : 30.h, top: 60.h),
        decoration: BoxDecoration(
          color: isLogoutButton
              ? AppColors.primarySecondaryElementText
              : AppColors.primaryElement,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isLogoutButton ? 'Logout' : 'Complete',
              style: TextStyle(
                color: AppColors.primaryElementText,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return Stack(
      children: [
        Container(
          width: 120.w,
          height: 120.w,
          decoration: BoxDecoration(
            color: AppColors.primarySecondaryBackground,
            borderRadius: BorderRadius.circular(60.w),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Image.asset(
            fit: BoxFit.cover,
            width: 120.w,
            height: 120.h,
            'assets/images/account_header.png',
          ),
        ),
        Positioned(
          bottom: 0.w,
          right: 0.w,
          height: 35.w,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 35.w,
              width: 35.w,
              padding: EdgeInsets.all(7.h),
              decoration: BoxDecoration(
                color: AppColors.primaryElement,
                borderRadius: BorderRadius.circular(40.w),
              ),
              child: Image.asset('assets/icons/edit.png'),
            ),
          ),
        )
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text(
        'Profile',
        style: TextStyle(
          color: AppColors.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
