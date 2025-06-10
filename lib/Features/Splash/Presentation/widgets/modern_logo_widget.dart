import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

/// Modern logo widget following clean architecture principles
class ModernLogoWidget extends StatelessWidget {
  final double width;
  final double height;

  const ModernLogoWidget({super.key, this.width = 300, this.height = 85});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: width + 20, maxHeight: height + 15),
      child: Stack(
        alignment: Alignment.center,
        children: [_buildBackgroundBlur(), _buildMainContainer()],
      ),
    );
  }

  Widget _buildBackgroundBlur() {
    return Container(
      width: width + 20,
      height: height + 15,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withOpacity(0.1),
            AppColors.secondary.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  Widget _buildMainContainer() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.primaryGradient,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(children: [_buildPatternOverlay(), _buildContent()]),
      ),
    );
  }

  Widget _buildPatternOverlay() {
    return Positioned.fill(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.1),
              Colors.transparent,
              Colors.black.withOpacity(0.05),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildBookIcon(),
          const SizedBox(width: 20),
          _buildTypography(),
        ],
      ),
    );
  }

  Widget _buildBookIcon() {
    return Container(
      width: 45,
      height: 55,
      decoration: BoxDecoration(
        color: AppColors.accent,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.auto_stories_rounded,
            color: AppColors.secondary,
            size: 28,
          ),
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTypography() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pick',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: AppColors.textLight,
            letterSpacing: 0.5,
            height: 1.0,
          ),
        ),
        Text(
          'book',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w300,
            color: AppColors.textLight.withOpacity(0.9),
            letterSpacing: 0.5,
            height: 1.0,
          ),
        ),
      ],
    );
  }
}
