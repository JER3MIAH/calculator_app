import 'package:converse/src/features/navigation/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    final user = FirebaseAuth.instance.currentUser;
    //Todo: fix redirect 

    if (user == null) {
      //? If User is not logged in, redirect to login page
      return GetNavConfig.fromRoute(AuthRoutes.login);
    } else {
      //? If User is logged in, allow navigation
      return null;
    }
  }
}
