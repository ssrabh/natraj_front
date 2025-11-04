import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:front_flutter/core/app_color.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.light,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 80),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "About Us",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ).animate().fadeIn(duration: 800.ms),
          const SizedBox(height: 30),
          Text(
            "Natraj Industry has been a trusted name in engineering and manufacturing for over four decades. We specialize in industrial solutions that combine innovation, reliability, and performance.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              color: AppColors.text.withOpacity(0.8),
              height: 1.5,
            ),
          ).animate().fadeIn(duration: 1200.ms),
        ],
      ),
    );
  }
}
