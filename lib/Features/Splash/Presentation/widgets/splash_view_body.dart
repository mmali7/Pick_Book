import 'package:flutter/material.dart';
import '../../../../core/widgets/pickbook_logo.dart';
import '../../../../constants.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightGrayColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated Pickbook Logo
            const AnimatedPickbookLogo(
              size: LogoSize.large,
              variant: LogoVariant.full,
            ),

            const SizedBox(height: 30),

            // Tagline
            Text(
              'Your Digital Library',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: kSecondaryColor.withOpacity(0.8),
                letterSpacing: 1.2,
              ),
            ),

            const SizedBox(height: 50),

            // Loading indicator
            SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                backgroundColor: kPrimaryColor.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
