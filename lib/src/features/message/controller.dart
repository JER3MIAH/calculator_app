import 'package:converse/src/features/message/state.dart';
import 'package:converse/src/shared/routes/names.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  MessageController();
  final state = MessageState();

  void goToProfile() async {
    await Get.toNamed(AppRoutes.Profile);
  }
}
