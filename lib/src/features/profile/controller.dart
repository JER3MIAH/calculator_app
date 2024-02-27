import 'package:converse/src/features/profile/state.dart';
import 'package:converse/src/shared/routes/names.dart';
import 'package:converse/src/shared/store/store.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController {
  ProfileController();
  final state = ProfileState();

  void goToProfile() async {
    await Get.toNamed(AppRoutes.Profile);
  }

  void logout() async {
    await GoogleSignIn().signOut();
    await UserStore.to.onLogout();
  }
}
