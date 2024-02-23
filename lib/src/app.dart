import 'package:converse/src/shared/routes/pages.dart';
import 'package:converse/src/shared/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Converse',
      // theme: theme,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
