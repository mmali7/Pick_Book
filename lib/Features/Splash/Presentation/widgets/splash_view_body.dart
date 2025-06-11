import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:pick_book/constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/animations/app_animations.dart';
import '../../Domain/views/home_view.dart';
import '../controllers/splash_controller.dart';
import 'modern_logo_widget.dart';
import 'animated_logo_widget.dart';
import 'loading_indicator_widget.dart';

/// Splash screen body following clean architecture principles
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _textController;
  late AnimationController _loadingController;

  @override
  void initState() {
    super.initState();
    _initializeAnimationControllers();
    _startAnimationSequence();
    _navigateToHome();
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      Get.to(
        () => HomeView(),
        transition: Transition.fadeIn,
        duration: kTransitionDuration,
      );
    });
  }

  void _initializeAnimationControllers() {
    _logoController = AnimationController(
      duration: SplashAnimationConfig.logoAnimationDuration,
      vsync: this,
    );

    _textController = AnimationController(
      duration: SplashAnimationConfig.textAnimationDuration,
      vsync: this,
    );

    _loadingController = AnimationController(
      duration: SplashAnimationConfig.loadingAnimationDuration,
      vsync: this,
    );
  }

  void _startAnimationSequence() async {
    await Future.delayed(SplashAnimationConfig.logoDelay);
    _logoController.forward();

    await Future.delayed(SplashAnimationConfig.textDelay);
    _textController.forward();

    await Future.delayed(SplashAnimationConfig.loadingDelay);
    _loadingController.forward();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _textController.dispose();
    _loadingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.backgroundGradient,
          ),
        ),
        child: SafeArea(child: _buildContent()),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          _buildAnimatedLogo(),
          const SizedBox(height: 40),
          _buildAnimatedTagline(),
          const Spacer(flex: 2),
          _buildAnimatedLoadingIndicator(),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  Widget _buildAnimatedLogo() {
    return AnimatedLogoWidget(
      controller: _logoController,
      child: const ModernLogoWidget(),
    );
  }

  Widget _buildAnimatedTagline() {
    return AnimatedBuilder(
      animation: _textController,
      builder: (context, child) {
        final slideAnimation =
            Tween<Offset>(
              begin: SplashAnimationConfig.textSlideBegin,
              end: SplashAnimationConfig.textSlideEnd,
            ).animate(
              CurvedAnimation(
                parent: _textController,
                curve: SplashAnimationConfig.textCurve,
              ),
            );

        final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _textController,
            curve: SplashAnimationConfig.textCurve,
          ),
        );

        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: _buildTaglineContent(),
          ),
        );
      },
    );
  }

  Widget _buildTaglineContent() {
    return Column(
      children: [
        Text(
          'Your Digital Library',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w300,
            letterSpacing: 2.0,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 60,
          height: 2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.secondary],
            ),
            borderRadius: BorderRadius.circular(1),
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedLoadingIndicator() {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return LoadingIndicatorWidget(
          animationController: _loadingController,
          message: controller.loadingMessage,
          isVisible: controller.isLoading,
        );
      },
    );
  }
}
