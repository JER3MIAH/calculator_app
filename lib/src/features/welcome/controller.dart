import 'package:converse/src/features/welcome/state.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  WelcomeController();
  final title = 'Converse .';
  final state = WelcomeState();

  @override
  void onReady() {
    print(' WelcomeController ');
    super.onReady();
  }
}