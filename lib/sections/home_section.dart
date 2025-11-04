import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:front_flutter/core/app_color.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: AppColors.heroGradient,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Welcome to Natraj Industry",
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.bold,
              color: AppColors.light,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2),
          const SizedBox(height: 16),
          Text(
            "Engineering Excellence Since 1980",
            style: TextStyle(
              fontSize: 24,
              color: AppColors.light.withOpacity(0.9),
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 1000.ms),
        ],
      ),
    );
  }
}
