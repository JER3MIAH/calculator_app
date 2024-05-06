import 'package:converse/src/features/navigation/nav.dart';
import 'package:converse/src/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Converse',
          theme: appTheme,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
