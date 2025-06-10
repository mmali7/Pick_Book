# Pickbook Logo Implementation Guide

## Overview
This guide documents the complete logo implementation for the Pickbook digital library app, including the design concept, file structure, and usage guidelines.

## Design Concept

### Brand Identity
- **App Name**: Pickbook
- **Tagline**: "Your Digital Library"
- **Concept**: A playful design combining a book with a "pick" element (hand picking a book from shelf)
- **Target Audience**: Digital book readers and library organizers

### Color Scheme
- **Primary Teal**: `#20B2AA` - Main brand color representing technology and innovation
- **Navy Blue**: `#1E3A8A` - Secondary color representing trust and knowledge
- **White**: `#FFFFFF` - Clean contrast and text
- **Light Gray**: `#F8FAFC` - Subtle backgrounds and disabled states
- **Dark Gray**: `#334155` - Text and details

## File Structure

```
pick_book/
├── assets/images/logo/
│   ├── pickbook_logo_full.svg      # Full logo with text
│   ├── pickbook_horizontal.svg     # Horizontal layout
│   ├── pickbook_vertical.svg       # Vertical layout
│   └── pickbook_icon.svg           # Icon only
├── lib/
│   ├── core/widgets/
│   │   └── pickbook_logo.dart      # Reusable logo widget
│   ├── constants.dart              # Updated brand colors
│   └── main.dart                   # Updated theme
└── pubspec.yaml                    # Added flutter_svg dependency
```

## Logo Variants

### 1. Full Logo (`pickbook_logo_full.svg`)
- **Dimensions**: 200x60px
- **Usage**: Splash screens, headers, main branding
- **Contains**: Icon + "Pick" + "book" text

### 2. Horizontal Logo (`pickbook_horizontal.svg`)
- **Dimensions**: 150x50px
- **Usage**: Navigation bars, compact headers
- **Contains**: Scaled icon + "Pickbook" text (single line)

### 3. Vertical Logo (`pickbook_vertical.svg`)
- **Dimensions**: 80x100px
- **Usage**: Compact spaces, mobile layouts
- **Contains**: Icon on top + "Pickbook" text below

### 4. Icon Only (`pickbook_icon.svg`)
- **Dimensions**: 50x50px
- **Usage**: App icons, favicons, small spaces
- **Contains**: Just the book-picking symbol

## Flutter Implementation

### Logo Widget Usage

```dart
import 'package:pick_book/core/widgets/pickbook_logo.dart';

// Basic usage
PickbookLogo()

// With size specification
PickbookLogo(
  size: LogoSize.large,
  variant: LogoVariant.horizontal,
)

// Animated version for splash screens
AnimatedPickbookLogo(
  size: LogoSize.large,
  variant: LogoVariant.full,
  duration: Duration(milliseconds: 1500),
)
```

### Available Sizes
- `LogoSize.small` - Compact version
- `LogoSize.medium` - Standard size (default)
- `LogoSize.large` - Prominent display

### Available Variants
- `LogoVariant.full` - Complete logo with text (default)
- `LogoVariant.horizontal` - Side-by-side layout
- `LogoVariant.vertical` - Stacked layout
- `LogoVariant.iconOnly` - Icon without text

## Color Constants

```dart
// Updated constants.dart
const kPrimaryColor = Color(0xFF20B2AA);      // Teal
const kSecondaryColor = Color(0xFF1E3A8A);    // Navy Blue
const kAccentColor = Color(0xFFFFFFFF);       // White
const kLightGrayColor = Color(0xFFF8FAFC);    // Light Gray
const kDarkGrayColor = Color(0xFF334155);     // Dark Gray
```

## App Theme Integration

The main app theme has been updated to use the new color scheme:

```dart
theme: ThemeData(
  primarySwatch: _createMaterialColor(kPrimaryColor),
  primaryColor: kPrimaryColor,
  scaffoldBackgroundColor: kLightGrayColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: kPrimaryColor,
    primary: kPrimaryColor,
    secondary: kSecondaryColor,
  ),
  // ... additional theme configuration
)
```

## Platform-Specific Icons

### Android Icons
- Located in: `android/app/src/main/res/mipmap-*/`
- Sizes: 48px (mdpi), 72px (hdpi), 96px (xhdpi), 144px (xxhdpi), 192px (xxxhdpi)
- Format: PNG
- Filename: `ic_launcher.png`

### iOS Icons
- Located in: `ios/Runner/Assets.xcassets/AppIcon.appiconset/`
- Multiple sizes from 20x20 to 1024x1024
- Format: PNG
- Various @1x, @2x, @3x variants

### Web Icons
- Located in: `web/` and `web/icons/`
- Includes favicon.png and PWA icons
- Sizes: 32px, 192px, 512px
- Maskable icon variants included

### macOS Icons
- Located in: `macos/Runner/Assets.xcassets/AppIcon.appiconset/`
- Sizes: 16px to 1024px
- Format: PNG

## Usage Guidelines

### Do's
✅ Use the full logo for main branding and splash screens
✅ Use horizontal variant for navigation bars
✅ Use vertical variant for compact mobile layouts
✅ Use icon-only for app icons and small spaces
✅ Maintain proper spacing around the logo
✅ Use on light backgrounds for best contrast

### Don'ts
❌ Don't stretch or distort the logo proportions
❌ Don't use on backgrounds that reduce readability
❌ Don't modify the colors without brand approval
❌ Don't add effects like shadows or gradients
❌ Don't use low-resolution versions for large displays

## Animation Guidelines

The `AnimatedPickbookLogo` widget provides:
- **Scale Animation**: Grows from 0.5x to 1.0x scale
- **Fade Animation**: Fades in from 0% to 100% opacity
- **Curve**: Uses `Curves.elasticOut` for a playful bounce effect
- **Duration**: Default 1.5 seconds (customizable)

## Accessibility

- All logo variants include proper semantic labels
- High contrast ratios maintained for text readability
- Scalable design works at all sizes
- Alternative text descriptions provided for screen readers

## Future Enhancements

### Planned Features
- [ ] Dark theme logo variants
- [ ] Additional animation effects
- [ ] Logo loading states
- [ ] Brand guidelines documentation
- [ ] Professional icon generation from SVG

### Icon Generation
For production use, consider:
1. Using professional tools like Adobe Illustrator
2. Converting SVG to high-quality PNG programmatically
3. Optimizing file sizes for different platforms
4. Creating adaptive icons for Android

## Dependencies

```yaml
dependencies:
  flutter_svg: ^2.0.10+1  # For SVG logo rendering
```

## Testing

To test the logo implementation:
1. Run `flutter pub get` to install dependencies
2. Launch the app: `flutter run`
3. Verify logo appears on splash screen
4. Check different logo variants in various contexts
5. Test on different screen sizes and orientations

## Support

For questions about logo usage or implementation:
- Refer to this documentation
- Check the Flutter widget implementation in `lib/core/widgets/pickbook_logo.dart`
- Review the design files in `assets/images/logo/`

---

**Created**: December 2024  
**Version**: 1.0  
**Last Updated**: Initial implementation