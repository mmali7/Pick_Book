import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum LogoSize { small, medium, large }

enum LogoVariant { full, horizontal, vertical, iconOnly }

class PickbookLogo extends StatelessWidget {
  final LogoSize size;
  final LogoVariant variant;
  final Color? color;

  const PickbookLogo({
    super.key,
    this.size = LogoSize.medium,
    this.variant = LogoVariant.full,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      _getAssetPath(),
      width: _getWidth(),
      height: _getHeight(),
      fit: BoxFit.contain,
      colorFilter: color != null
          ? ColorFilter.mode(color!, BlendMode.srcIn)
          : null,
      placeholderBuilder: (BuildContext context) => Container(
        width: _getWidth(),
        height: _getHeight(),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: Icon(Icons.book, color: Colors.grey, size: 24),
        ),
      ),
    );
  }

  String _getAssetPath() {
    switch (variant) {
      case LogoVariant.full:
        return 'assets/images/logo/pickbook_logo_full.svg';
      case LogoVariant.horizontal:
        return 'assets/images/logo/pickbook_horizontal.svg';
      case LogoVariant.vertical:
        return 'assets/images/logo/pickbook_vertical.svg';
      case LogoVariant.iconOnly:
        return 'assets/images/logo/pickbook_icon.svg';
    }
  }

  double _getWidth() {
    switch (variant) {
      case LogoVariant.full:
        switch (size) {
          case LogoSize.small:
            return 120;
          case LogoSize.medium:
            return 200;
          case LogoSize.large:
            return 300;
        }
      case LogoVariant.horizontal:
        switch (size) {
          case LogoSize.small:
            return 90;
          case LogoSize.medium:
            return 150;
          case LogoSize.large:
            return 225;
        }
      case LogoVariant.vertical:
        switch (size) {
          case LogoSize.small:
            return 48;
          case LogoSize.medium:
            return 80;
          case LogoSize.large:
            return 120;
        }
      case LogoVariant.iconOnly:
        switch (size) {
          case LogoSize.small:
            return 30;
          case LogoSize.medium:
            return 50;
          case LogoSize.large:
            return 80;
        }
    }
  }

  double _getHeight() {
    switch (variant) {
      case LogoVariant.full:
        switch (size) {
          case LogoSize.small:
            return 36;
          case LogoSize.medium:
            return 60;
          case LogoSize.large:
            return 90;
        }
      case LogoVariant.horizontal:
        switch (size) {
          case LogoSize.small:
            return 30;
          case LogoSize.medium:
            return 50;
          case LogoSize.large:
            return 75;
        }
      case LogoVariant.vertical:
        switch (size) {
          case LogoSize.small:
            return 60;
          case LogoSize.medium:
            return 100;
          case LogoSize.large:
            return 150;
        }
      case LogoVariant.iconOnly:
        switch (size) {
          case LogoSize.small:
            return 30;
          case LogoSize.medium:
            return 50;
          case LogoSize.large:
            return 80;
        }
    }
  }
}

// Animated logo widget for splash screens
class AnimatedPickbookLogo extends StatefulWidget {
  final LogoSize size;
  final LogoVariant variant;
  final Duration duration;

  const AnimatedPickbookLogo({
    super.key,
    this.size = LogoSize.large,
    this.variant = LogoVariant.full,
    this.duration = const Duration(milliseconds: 1500),
  });

  @override
  State<AnimatedPickbookLogo> createState() => _AnimatedPickbookLogoState();
}

class _AnimatedPickbookLogoState extends State<AnimatedPickbookLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);

    _scaleAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: PickbookLogo(size: widget.size, variant: widget.variant),
          ),
        );
      },
    );
  }
}
