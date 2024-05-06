import 'package:converse/src/features/home/presentation/widgets/drawer_tile.dart';
import 'package:converse/src/shared/shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YBox(30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30.r,
                      backgroundColor: appColors.blue.withOpacity(.5),
                      child: Icon(
                        CupertinoIcons.person,
                        color: appColors.white,
                      ),
                    ),
                    AppInkWell(
                      onTap: () {},
                      child: const Icon(CupertinoIcons.moon),
                    ),
                  ],
                ),
                YBox(10.h),
                Text(
                  'Jeremiah',
                  style: TextStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
          ),
          YBox(10.h),
          Container(
            height: .5.h,
            width: double.infinity,
            color: appColors.grey,
          ),
          YBox(20.h),
          AppDrawerTile(
            title: 'World chat',
            icon: CupertinoIcons.globe,
            onTap: () {},
          ),
          AppDrawerTile(
            title: 'Settings',
            icon: CupertinoIcons.settings,
            onTap: () {},
          ),
          const Spacer(),
          AppDrawerTile(
            title: 'Logout',
            icon: Icons.logout,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
