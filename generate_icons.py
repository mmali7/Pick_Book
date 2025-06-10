#!/usr/bin/env python3
"""
Simple script to create basic PNG icons for the Pickbook app.
This creates a simple colored square icon as a placeholder until proper icons are generated.
"""

from PIL import Image, ImageDraw, ImageFont
import os

# Pickbook brand colors
TEAL = (32, 178, 170)  # #20B2AA
NAVY = (30, 58, 138)   # #1E3A8A
WHITE = (255, 255, 255)
LIGHT_GRAY = (248, 250, 252)

def create_simple_icon(size):
    """Create a simple book-style icon"""
    img = Image.new('RGBA', (size, size), (0, 0, 0, 0))
    draw = ImageDraw.Draw(img)
    
    # Background circle
    margin = size // 10
    draw.ellipse([margin, margin, size-margin, size-margin], fill=TEAL)
    
    # Book representation
    book_width = size // 3
    book_height = size // 2
    book_x = (size - book_width) // 2
    book_y = (size - book_height) // 2
    
    # Main book
    draw.rectangle([book_x, book_y, book_x + book_width, book_y + book_height], fill=WHITE)
    
    # Book spine
    spine_width = size // 20
    draw.rectangle([book_x, book_y, book_x + spine_width, book_y + book_height], fill=NAVY)
    
    # Book lines
    line_y1 = book_y + book_height // 4
    line_y2 = book_y + book_height // 2
    line_y3 = book_y + 3 * book_height // 4
    
    draw.line([book_x + spine_width + 2, line_y1, book_x + book_width - 2, line_y1], fill=LIGHT_GRAY, width=1)
    draw.line([book_x + spine_width + 2, line_y2, book_x + book_width - 2, line_y2], fill=LIGHT_GRAY, width=1)
    draw.line([book_x + spine_width + 2, line_y3, book_x + book_width - 2, line_y3], fill=LIGHT_GRAY, width=1)
    
    return img

def create_icons():
    """Create all required icon sizes"""
    
    # Android icon sizes
    android_sizes = {
        'mipmap-mdpi': 48,
        'mipmap-hdpi': 72,
        'mipmap-xhdpi': 96,
        'mipmap-xxhdpi': 144,
        'mipmap-xxxhdpi': 192
    }
    
    # iOS icon sizes
    ios_sizes = {
        'Icon-App-20x20@1x.png': 20,
        'Icon-App-20x20@2x.png': 40,
        'Icon-App-20x20@3x.png': 60,
        'Icon-App-29x29@1x.png': 29,
        'Icon-App-29x29@2x.png': 58,
        'Icon-App-29x29@3x.png': 87,
        'Icon-App-40x40@1x.png': 40,
        'Icon-App-40x40@2x.png': 80,
        'Icon-App-40x40@3x.png': 120,
        'Icon-App-60x60@2x.png': 120,
        'Icon-App-60x60@3x.png': 180,
        'Icon-App-76x76@1x.png': 76,
        'Icon-App-76x76@2x.png': 152,
        'Icon-App-83.5x83.5@2x.png': 167,
        'Icon-App-1024x1024@1x.png': 1024
    }
    
    # Web icon sizes
    web_sizes = {
        'favicon.png': 32,
        'Icon-192.png': 192,
        'Icon-512.png': 512,
        'Icon-maskable-192.png': 192,
        'Icon-maskable-512.png': 512
    }
    
    # macOS icon sizes
    macos_sizes = {
        'app_icon_16.png': 16,
        'app_icon_32.png': 32,
        'app_icon_64.png': 64,
        'app_icon_128.png': 128,
        'app_icon_256.png': 256,
        'app_icon_512.png': 512,
        'app_icon_1024.png': 1024
    }
    
    print("Creating Android icons...")
    for folder, size in android_sizes.items():
        os.makedirs(f'android/app/src/main/res/{folder}', exist_ok=True)
        icon = create_simple_icon(size)
        icon.save(f'android/app/src/main/res/{folder}/ic_launcher.png')
        print(f"Created {folder}/ic_launcher.png ({size}x{size})")
    
    print("\nCreating iOS icons...")
    ios_path = 'ios/Runner/Assets.xcassets/AppIcon.appiconset'
    os.makedirs(ios_path, exist_ok=True)
    for filename, size in ios_sizes.items():
        icon = create_simple_icon(size)
        icon.save(f'{ios_path}/{filename}')
        print(f"Created {filename} ({size}x{size})")
    
    print("\nCreating web icons...")
    for filename, size in web_sizes.items():
        icon = create_simple_icon(size)
        icon.save(f'web/{filename}')
        print(f"Created web/{filename} ({size}x{size})")
    
    print("\nCreating macOS icons...")
    macos_path = 'macos/Runner/Assets.xcassets/AppIcon.appiconset'
    os.makedirs(macos_path, exist_ok=True)
    for filename, size in macos_sizes.items():
        icon = create_simple_icon(size)
        icon.save(f'{macos_path}/{filename}')
        print(f"Created {filename} ({size}x{size})")
    
    print("\nAll icons created successfully!")

if __name__ == "__main__":
    try:
        create_icons()
    except ImportError:
        print("PIL (Pillow) is required to run this script.")
        print("Install it with: pip install Pillow")
    except Exception as e:
        print(f"Error creating icons: {e}")