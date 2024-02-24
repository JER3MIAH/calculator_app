import 'package:converse/src/features/profile/state.dart';
import 'package:converse/src/shared/routes/names.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  ProfileController();
  final state = ProfileState();

  void goToProfile() async {
    await Get.toNamed(AppRoutes.Profile);
  }
}
