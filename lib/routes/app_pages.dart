import 'package:flutter_push_notify/bindings/home_bindings.dart';
import 'package:get/get.dart';
import '../views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBindings(),
    ),
  ];
}
