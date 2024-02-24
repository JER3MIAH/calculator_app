import 'package:converse/src/features/auth/sign_in/sign_in.dart';
import 'package:converse/src/shared/entities/entities.dart';
import 'package:converse/src/shared/routes/names.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  SignInController();
  final state = SignInState();

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['openid']);

  void handleSignIn(LoginType type) async {
    try {
      if (type == LoginType.google) {
        debugPrint('logging in with google. . .');
        var user = await _googleSignIn.signIn();
        if (user != null) {
          String? displayName = user.displayName;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ?? 'assets/icons/google.png';
          LoginRequestEntity loginRequestEntity = LoginRequestEntity();
          loginRequestEntity.avatar = photoUrl;
          loginRequestEntity.name = displayName;
          loginRequestEntity.email = email;
          loginRequestEntity.openId = id;
          loginRequestEntity.type = 2;
          asyncPostAllData();
        } else {
          debugPrint('user is null');
        }
      } else if (type == LoginType.facebook) {
        debugPrint('logging in with facebook. . .');
      } else if (type == LoginType.apple) {
        debugPrint('logging in with apple. . .');
      } else {
        debugPrint('logging in with phone number. . .');
      }
    } catch (e) {
      debugPrint('error logging in $e');
    }
  }

  asyncPostAllData(){
    Get.offAllNamed(AppRoutes.Message);
  }
}
