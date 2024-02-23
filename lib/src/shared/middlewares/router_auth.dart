// import 'package:converse/src/shared/routes/names.dart';
// import 'package:converse/src/shared/store/user.dart';
// import 'package:flutter/material.dart';

// import 'package:get/get.dart';

// /// 检查是否登录
// class RouteAuthMiddleware extends GetMiddleware {
//   // priority 数字小优先级高
//   @override
//   int? priority = 0;

//   RouteAuthMiddleware({required this.priority});

//   @override
//   RouteSettings? redirect(String? route) {
//     if (UserStore.to.isLogin || route == AppRoutes.SIGN_IN || route == AppRoutes.INITIAL) {
//       return null;
//     } else {
//       Future.delayed(
//           Duration(seconds: 2), () => Get.snackbar("Tips", "Login expired, please login again!"));
//       return RouteSettings(name: AppRoutes.SIGN_IN);
//     }
//   }
// }
