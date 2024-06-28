import 'package:flutter/material.dart';
import 'package:flutter_push_notify/bindings/initial_bindings.dart';
// import 'package:flutter_push_notify/bindings/home_bindings.dart';
import 'package:flutter_push_notify/routes/app_pages.dart';
import 'package:flutter_push_notify/services/notifications_service.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationsService().initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Notifications Showcase',
      initialBinding: InitialBindings(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
