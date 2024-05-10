import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:converse/src/features/home/presentation/drawer/app_drawer.dart';
import 'package:converse/src/features/home/presentation/screens/views/list_of_users.dart';
import 'package:converse/src/shared/shared.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
        backgroundColor: theme.background,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: theme.primary,
          title: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Converse',
                speed: const Duration(milliseconds: 500),
                textStyle: TextStyle(
                  color: appColors.white,
                  fontSize: 22.sp,
                ),
              ),
            ],
            onTap: () {
              print("Tap Event");
            },
          ),
          leading: Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: SvgAsset(
                  assetName: drawerIcon,
                  color: appColors.white,
                  height: 25.h,
                  width: 25.w,
                ),
              ),
            );
          }),
        ),
        body: const ListOfUsersView(),
        drawer: const AppDrawer());
  }
}
