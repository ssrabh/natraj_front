import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:front_flutter/core/app_color/program_page_color.dart';
import 'package:front_flutter/widgets/app_button.dart';

class ProgramSection extends StatelessWidget {
  const ProgramSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      color: ProgramPageColor.background,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🧩 Title Section
          Text(
            "Exclusive One-Day Business Launch Event",
            style: TextStyle(
              fontSize: isMobile ? 28 : 40,
              fontWeight: FontWeight.bold,
              color: ProgramPageColor.title,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),

          const SizedBox(height: 40),

          // 📝 Feature Grid
          isMobile ? _buildMobileFeatures() : _buildDesktopFeatures(),

          const SizedBox(height: 80),

          // 💰 Program Fee Card
          _buildProgramCard(context, isMobile),
        ],
      ),
    );
  }

  Widget _buildDesktopFeatures() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildFeatureList([
          "Only 10 seats per batch for intimate, personalized mentorship",
          "Week-by-week execution roadmap to get from blueprint to production",
        ]),
        _buildFeatureList([
          "Behind-the-scenes access to operational Nagpal Industries factory",
          "Optional “Done-With-You” complete factory setup service",
        ]),
      ],
    );
  }

  Widget _buildMobileFeatures() {
    return Column(
      children: [
        _buildFeatureList([
          "Only 10 seats per batch for intimate, personalized mentorship",
          "Behind-the-scenes access to operational Nagpal Industries factory",
          "Week-by-week execution roadmap to get from blueprint to production",
          "Optional “Done-With-You” complete factory setup service",
        ]),
      ],
    );
  }

  Widget _buildFeatureList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check_circle_outline,
                      color: Colors.amber, size: 24),
                  const SizedBox(width: 12),
                  Flexible(
                    // ✅ instead of Expanded
                    fit: FlexFit.loose,
                    child: Text(
                      item,
                      style: TextStyle(
                        color: ProgramPageColor.text,
                        fontSize: 18,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _buildProgramCard(BuildContext context, bool isMobile) {
    return Container(
      width: isMobile ? double.infinity : 500,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: ProgramPageColor.cardGradient,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: ProgramPageColor.shadow.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            "PROGRAM FEE",
            style: TextStyle(
              fontSize: 18,
              color: ProgramPageColor.subtitle,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "INR 10,000",
                style: TextStyle(
                  fontSize: isMobile ? 40 : 60,
                  fontWeight: FontWeight.bold,
                  color: ProgramPageColor.title,
                ),
              ),
              Text(
                " + GST",
                style: TextStyle(
                  fontSize: 16,
                  color: ProgramPageColor.subtitle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "INR 29,999 + GST",
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: ProgramPageColor.subtitle.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: ProgramPageColor.discountBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "33% OFF",
              style: TextStyle(
                color: ProgramPageColor.discountText,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 24),
          AppButton(
              text: "Enroll Now",
              onPressed: () {
                // Handle enrollment action
              }),
          const SizedBox(height: 32),
          _buildProgramBenefits(),
          const SizedBox(height: 16),
          Text(
            "Secure payment processing • Only 10 seats available per batch",
            style: TextStyle(
              fontSize: 12,
              color: ProgramPageColor.subtitle.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildProgramBenefits() {
    final benefits = [
      "Get Your 90-Day Factory Launch Plan: Walk away with the complete step-by-step execution plan.",
      "Exclusive Live Factory Tour: Go behind the scenes of a real, operational manufacturing plant.",
      "All-Day Mentorship: Get direct, personal access and Q&A with Tanmay Nagpal.",
      "Build Your Business Blueprint: Master the financials, project reports, and sales strategies.",
      "Join an Elite Network: Connect with a curated group of 10 serious entrepreneurs.",
      "Includes 5-Star Luxury Hospitality: All-inclusive meals and refreshments for the day.",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: benefits
          .map(
            (b) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.check_circle_outline,
                      color: Colors.amber, size: 22),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      b,
                      style: TextStyle(
                        color: ProgramPageColor.text,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
