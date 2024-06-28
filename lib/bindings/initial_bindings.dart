import 'package:flutter_push_notify/services/notifications_service.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationsService>(() => NotificationsService());
  }
}
