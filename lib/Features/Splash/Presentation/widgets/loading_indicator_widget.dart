import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/animations/app_animations.dart';

/// Loading indicator widget following clean architecture principles
class LoadingIndicatorWidget extends StatelessWidget {
  final AnimationController animationController;
  final String message;
  final bool isVisible;

  const LoadingIndicatorWidget({
    super.key,
    required this.animationController,
    required this.message,
    this.isVisible = true,
  });

  @override
  Widget build(BuildContext context) {
    if (!isVisible) return const SizedBox.shrink();

    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        final fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animationController,
            curve: SplashAnimationConfig.loadingCurve,
          ),
        );

        return FadeTransition(
          opacity: fadeAnimation,
          child: _buildContent(context),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildProgressIndicator(),
        const SizedBox(height: 16),
        _buildLoadingText(context),
      ],
    );
  }

  Widget _buildProgressIndicator() {
    return SizedBox(
      width: 32,
      height: 32,
      child: CircularProgressIndicator(
        strokeWidth: 2.5,
        valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
        backgroundColor: AppColors.primary.withOpacity(0.2),
      ),
    );
  }

  Widget _buildLoadingText(BuildContext context) {
    return Text(
      message,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: AppColors.textSecondary.withOpacity(0.7),
        fontWeight: FontWeight.w300,
        letterSpacing: 1.0,
      ),
    );
  }
}
