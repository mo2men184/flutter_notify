import 'package:flutter/material.dart';
import 'package:flutter_push_notify/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Service'),
      ),
      body: Center(
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Current Notification Provider: ${_homeController.isFCM.value ? 'FCM' : 'OneSignal'}',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _homeController.switchToFCM,
                child: Text('Switch to FCM'),
              ),
              ElevatedButton(
                onPressed: _homeController.switchToOneSignal,
                child: Text('Switch to OneSignal'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
