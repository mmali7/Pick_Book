import 'package:flutter/material.dart';
import '../../../../core/animations/app_animations.dart';

/// Animated logo widget following clean architecture principles
class AnimatedLogoWidget extends StatelessWidget {
  final AnimationController controller;
  final Widget child;

  const AnimatedLogoWidget({
    super.key,
    required this.controller,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final scaleAnimation =
            Tween<double>(
              begin: SplashAnimationConfig.logoScaleBegin,
              end: SplashAnimationConfig.logoScaleEnd,
            ).animate(
              CurvedAnimation(
                parent: controller,
                curve: SplashAnimationConfig.logoCurve,
              ),
            );

        final opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: SplashAnimationConfig.logoOpacityInterval,
          ),
        );

        return Transform.scale(
          scale: scaleAnimation.value,
          child: Opacity(opacity: opacityAnimation.value, child: child),
        );
      },
    );
  }
}
