import 'package:get/get.dart';
import '../../Features/Splash/Domain/usecases/splash_usecase.dart';
import '../../Features/Splash/Presentation/controllers/splash_controller.dart';

/// Dependency injection setup following clean architecture principles
class DependencyInjection {
  static void init() {
    _injectSplashDependencies();
  }

  static void _injectSplashDependencies() {
    // Use cases
    Get.lazyPut<SplashUseCase>(() => SplashUseCase());

    // Controllers
    Get.lazyPut<SplashController>(() => SplashController(Get.find()));
  }
}
