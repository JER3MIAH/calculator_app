import 'package:converse/src/features/welcome/state.dart';
import 'package:converse/src/shared/routes/names.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  WelcomeController();
  final title = 'Converse .';
  final state = WelcomeState();

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000),
        () => Get.offAllNamed(AppRoutes.Message));
    super.onReady();
  }
}
