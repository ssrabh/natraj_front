import 'package:flutter/material.dart';

// Defines a clean, modern color scheme for Natraj Industry.
class AppColors {
  // Primary: A strong, deep indigo for main headers and branding.
  static const Color primary = Color(0xFF1A237E);

  // Secondary: A lighter, professional blue for accents and hover effects.
  static const Color secondary = Color(0xFF3F51B5);

  // Accent: A bright teal/cyan for calls to action and highlights.
  static const Color accent = Color(0xFF00BCD4);

  // Background: A slightly off-white for main body content.
  static const Color background = Color(0xFFF5F5F5);

  // Text: Dark gray for body text, ensuring high readability.
  static const Color text = Color(0xFF333333);

  // White/Light for contrast against primary.
  static const Color light = Colors.white;

  // A gradient for the Hero section (optional, for a premium look)
  static const LinearGradient heroGradient = LinearGradient(
    colors: [primary, Color(0xFF303F9F)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}
