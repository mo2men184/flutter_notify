import 'package:get/get.dart';

import '../services/notifications_service.dart';

class HomeController extends GetxController {
  final NotificationsService _notificationsService =
      Get.find<NotificationsService>();

  RxBool get isFCM => _notificationsService.isFCM;

  void switchToFCM() {
    _notificationsService.switchProvider(true);
  }

  void switchToOneSignal() {
    _notificationsService.switchProvider(false);
  }
}
