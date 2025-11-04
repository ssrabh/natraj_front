import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:front_flutter/core/app_color/hero_page_color.dart';
import 'package:front_flutter/sections/form_page.dart';
import 'package:front_flutter/widgets/app_button.dart';
import 'package:front_flutter/widgets/utils.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/images/hero-bg.png"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            HeroPageColor.backgroundOverlay.withOpacity(0.75),
            BlendMode.darken,
          ),
        ),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 🔹 Top badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: HeroPageColor.badgeBg,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white.withOpacity(0.15)),
            ),
            child: const Text(
              "Est. 1962 – Honored by PM Jawaharlal Nehru",
              style: TextStyle(
                color: HeroPageColor.light,
                fontSize: 14,
                letterSpacing: 0.5,
              ),
            ),
          ).animate().fadeIn(duration: 600.ms),

          const SizedBox(height: 32),

          // 🔹 Main heading
          Text(
            "Build Your Packaging Empire",
            style: const TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.bold,
              color: HeroPageColor.light,
              height: 1.2,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 800.ms).slideY(begin: 0.2),

          const SizedBox(height: 16),

          // 🔹 Subheading
          Text(
            "Launch Your Factory in 90 Days!",
            style: TextStyle(
              fontSize: 22,
              color: HeroPageColor.lightText.withOpacity(0.95),
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 1000.ms),

          const SizedBox(height: 16),

          // 🔹 Supporting paragraph
          SizedBox(
            width: 700,
            child: Text(
              "Get the 90-day execution plan, expert mentorship, and the Natraj legacy—your complete blueprint for a profitable manufacturing unit.",
              style: TextStyle(
                fontSize: 16,
                color: HeroPageColor.lightText.withOpacity(0.85),
                height: 1.6,
              ),
              textAlign: TextAlign.center,
            ),
          ).animate().fadeIn(duration: 1200.ms),

          const SizedBox(height: 32),

          // 🔹 Register section
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                text: "Enroll Now",
                variant: ButtonVariant.primary,
                onPressed: () => Utils.pushPage(context, FormPage()),
              ),
              const SizedBox(width: 16),
              AppButton(
                text: "Learn More",
                variant: ButtonVariant.secondary,
                onPressed: () {},
                width: 200,
                height: 55,
              ),
            ],
          ),

          const SizedBox(height: 64),

          // 🔹 Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStat("60+", "Years of Legacy"),
              const SizedBox(width: 60),
              _buildStat("90", "Days to Launch"),
              const SizedBox(width: 60),
              _buildStat("10", "Seats Per Batch"),
            ],
          ).animate().fadeIn(duration: 1600.ms),
        ],
      ),
    );
  }

  Widget _buildStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: HeroPageColor.primary,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: HeroPageColor.lightText.withOpacity(0.95),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
