import 'package:flutter/material.dart';

/// Animation configurations following clean architecture principles
class AppAnimations {
  AppAnimations._();

  // Animation durations
  static const Duration fast = Duration(milliseconds: 300);
  static const Duration medium = Duration(milliseconds: 600);
  static const Duration slow = Duration(milliseconds: 1200);
  static const Duration extraSlow = Duration(milliseconds: 1500);

  // Animation curves
  static const Curve elasticOut = Curves.elasticOut;
  static const Curve easeOut = Curves.easeOut;
  static const Curve easeOutCubic = Curves.easeOutCubic;
  static const Curve easeIn = Curves.easeIn;
}

/// Splash screen animation configuration
class SplashAnimationConfig {
  SplashAnimationConfig._();

  static const Duration logoAnimationDuration = AppAnimations.slow;
  static const Duration textAnimationDuration = AppAnimations.medium;
  static const Duration loadingAnimationDuration = AppAnimations.medium;

  static const Duration logoDelay = AppAnimations.fast;
  static const Duration textDelay = Duration(milliseconds: 800);
  static const Duration loadingDelay = Duration(milliseconds: 400);

  static const Curve logoCurve = AppAnimations.elasticOut;
  static const Curve textCurve = AppAnimations.easeOutCubic;
  static const Curve loadingCurve = AppAnimations.easeIn;

  // Animation intervals
  static const Interval logoOpacityInterval = Interval(
    0.0,
    0.6,
    curve: AppAnimations.easeOut,
  );

  // Scale values
  static const double logoScaleBegin = 0.3;
  static const double logoScaleEnd = 1.0;

  // Slide values
  static const Offset textSlideBegin = Offset(0, 0.5);
  static const Offset textSlideEnd = Offset.zero;
}
