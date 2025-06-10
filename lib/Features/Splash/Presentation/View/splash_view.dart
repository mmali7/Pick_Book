import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';
import '../widgets/splash_view_body.dart';

/// Splash view following clean architecture principles
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return const SplashViewBody();
      },
    );
  }
}
