import 'package:converse/src/shared/routes/pages.dart';
import 'package:converse/src/shared/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 780),
        builder: (context, _) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Converse',
            theme: ThemeData(primarySwatch: Colors.blue),
            initialRoute: AppPages.initial,
            getPages: AppPages.routes,
          );
        });
  }
}
