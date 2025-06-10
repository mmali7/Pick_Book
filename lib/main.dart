import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/theme/app_theme.dart';
import 'core/di/dependency_injection.dart';
import 'Features/Splash/Presentation/View/splash_view.dart';

void main() {
  // Initialize dependency injection
  DependencyInjection.init();

  runApp(const PickbookApp());
}

/// Main application class following clean architecture principles
class PickbookApp extends StatelessWidget {
  const PickbookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pickbook',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashView(),
      // TODO: Add routes configuration
      // getPages: AppRoutes.routes,
    );
  }
}
