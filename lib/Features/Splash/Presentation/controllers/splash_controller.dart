import 'package:get/get.dart';
import '../../Domain/usecases/splash_usecase.dart';

/// Splash screen controller following clean architecture principles
class SplashController extends GetxController {
  final SplashUseCase _splashUseCase;

  SplashController(this._splashUseCase);

  // Observable states
  final RxBool _isLoading = true.obs;
  final RxBool _isInitialized = false.obs;
  final RxString _loadingMessage = 'Loading...'.obs;

  // Getters
  bool get isLoading => _isLoading.value;
  bool get isInitialized => _isInitialized.value;
  String get loadingMessage => _loadingMessage.value;

  @override
  void onInit() {
    super.onInit();
    _initializeSplash();
  }

  /// Initialize splash screen
  Future<void> _initializeSplash() async {
    try {
      _isLoading.value = true;
      _loadingMessage.value = 'Initializing...';

      // Initialize app
      await _splashUseCase.initialize();

      _loadingMessage.value = 'Loading configuration...';
      await _splashUseCase.loadAppConfiguration();

      _loadingMessage.value = 'Preparing data...';
      await _splashUseCase.preloadEssentialData();

      _isInitialized.value = true;
      _loadingMessage.value = 'Ready!';

      // Navigate to next screen after a short delay
      await Future.delayed(const Duration(milliseconds: 500));
      _navigateToNextScreen();
    } catch (e) {
      _loadingMessage.value = 'Error occurred';
      // Handle error
    } finally {
      _isLoading.value = false;
    }
  }

  /// Navigate to the next screen based on authentication status
  Future<void> _navigateToNextScreen() async {
    final isAuthenticated = await _splashUseCase.isUserAuthenticated();

    if (isAuthenticated) {
      // Navigate to home screen
      // Get.offAllNamed('/home');
    } else {
      // Navigate to onboarding or login screen
      // Get.offAllNamed('/onboarding');
    }
  }

  /// Retry initialization
  void retryInitialization() {
    _initializeSplash();
  }
}
