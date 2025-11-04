import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:front_flutter/core/app_color/bootcamp_page_color.dart';

class WhyJoinBootcampSection extends StatelessWidget {
  const WhyJoinBootcampSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      color: BootcampColor.background,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 🏆 Title + Subtitle
          Text(
            "Why Join This Bootcamp",
            style: TextStyle(
              fontSize: isMobile ? 28 : 40,
              fontWeight: FontWeight.bold,
              color: BootcampColor.textDark,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),
          const SizedBox(height: 12),
          Text(
            "A real-world mentorship experience — blending factory tours, expert guidance, and actionable business insights.",
            style: TextStyle(
              fontSize: isMobile ? 16 : 18,
              color: BootcampColor.textLight,
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 800.ms),

          const SizedBox(height: 60),

          // 🧩 Features (What You’ll Get)
          _buildSubTitle("What You’ll Get", isMobile),
          const SizedBox(height: 24),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: _features
                .map((f) => _HoverFeatureCard(f: f, isMobile: isMobile))
                .toList(),
          ),

          const SizedBox(height: 80),

          // 💼 Differences (Why It’s Unique)
          _buildSubTitle("What Makes This Bootcamp Different", isMobile),
          const SizedBox(height: 24),
          Column(
            children: _comparisons
                .map((c) => _HoverComparisonCard(c: c, isMobile: isMobile))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSubTitle(String title, bool isMobile) {
    return Text(
      title,
      style: TextStyle(
        fontSize: isMobile ? 22 : 28,
        fontWeight: FontWeight.w700,
        color: BootcampColor.textDark,
      ),
      textAlign: TextAlign.center,
    ).animate().fadeIn(duration: 500.ms);
  }

  // 🧩 Data
  List<Map<String, dynamic>> get _features => [
        {
          "icon": Icons.person_outline,
          "title": "Direct Mentorship",
          "desc":
              "Spend the entire day with Tanmay Nagpal, learning from his family's 60+ years of experience."
        },
        {
          "icon": Icons.factory_outlined,
          "title": "Live Factory Tour",
          "desc":
              "Step into a running corrugated box factory — experience the machines, workflow, and production systems firsthand."
        },
        {
          "icon": Icons.description_outlined,
          "title": "Complete A-to-Z Blueprint",
          "desc":
              "Get clarity on investment, machines, setup, marketing, and scaling — everything you need to start right."
        },
        {
          "icon": Icons.calendar_month_outlined,
          "title": "90-Day Launch Plan",
          "desc":
              "Leave with a practical, time-bound action plan to launch your factory within 90–120 days."
        },
        {
          "icon": Icons.build_circle_outlined,
          "title": "Done-With-You Setup",
          "desc":
              "Optional full setup support — from factory layout to running production successfully."
        },
      ];

  List<Map<String, dynamic>> get _comparisons => [
        {
          "other": "Generic online courses with no real-world context.",
          "bootcamp":
              "In-person, hands-on sessions inside an operational Natraj Industries plant."
        },
        {
          "other": "Trainers who’ve never run a factory.",
          "bootcamp":
              "Learn from 3rd-generation leaders with 60+ years of industry success."
        },
        {
          "other": "One of hundreds in a webinar.",
          "bootcamp": "Only 10 seats — personalized mentorship and access."
        },
        {
          "other": "Theory-heavy slides and certificates.",
          "bootcamp":
              "Action-driven learning with an execution roadmap and personal support."
        },
        {
          "other": "After training, you’re on your own.",
          "bootcamp":
              "Post-session guidance and optional factory setup service — end-to-end."
        },
      ];
}

// 🌟 Feature Card with Hover Effect
class _HoverFeatureCard extends StatefulWidget {
  final Map<String, dynamic> f;
  final bool isMobile;
  const _HoverFeatureCard({required this.f, required this.isMobile});

  @override
  State<_HoverFeatureCard> createState() => _HoverFeatureCardState();
}

class _HoverFeatureCardState extends State<_HoverFeatureCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: widget.isMobile ? double.infinity : 380,
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: _hover
              ? BootcampColor.primary.withOpacity(0.08)
              : BootcampColor.card,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: _hover
                  ? BootcampColor.primary.withOpacity(0.4)
                  : Colors.black12.withOpacity(0.06),
              blurRadius: _hover ? 20 : 10,
              offset: const Offset(0, 6),
            ),
          ],
          border: Border.all(
            color: _hover
                ? BootcampColor.primary.withOpacity(0.7)
                : Colors.transparent,
            width: 1.2,
          ),
        ),
        transform: _hover
            ? (Matrix4.identity()
              ..translate(0, -6, 0)
              ..scale(1.02))
            : Matrix4.identity(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: BootcampColor.accent.withOpacity(0.4),
              radius: 24,
              child: Icon(widget.f['icon'],
                  color: BootcampColor.primary, size: 24),
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.f['title'],
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      color: BootcampColor.textDark,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.f['desc'],
                    style: TextStyle(
                      color: BootcampColor.textLight,
                      fontSize: 15,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 700.ms).slideY(begin: 0.2);
  }
}

// 💼 Comparison Card with Subtle Hover Accent
class _HoverComparisonCard extends StatefulWidget {
  final Map<String, dynamic> c;
  final bool isMobile;
  const _HoverComparisonCard({required this.c, required this.isMobile});

  @override
  State<_HoverComparisonCard> createState() => _HoverComparisonCardState();
}

class _HoverComparisonCardState extends State<_HoverComparisonCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: BootcampColor.card,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hover
                ? BootcampColor.primary.withOpacity(0.6)
                : Colors.transparent,
            width: 1.3,
          ),
          boxShadow: [
            BoxShadow(
              color: _hover
                  ? BootcampColor.primary.withOpacity(0.35)
                  : Colors.black12.withOpacity(0.08),
              blurRadius: _hover ? 16 : 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        transform: _hover
            ? (Matrix4.identity()
              ..translate(0, -6, 0)
              ..scale(1.01))
            : Matrix4.identity(),
        child: widget.isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildComparisonRow("OTHERS", widget.c["other"]),
                  const SizedBox(height: 12),
                  _buildComparisonRow("THIS BOOTCAMP", widget.c["bootcamp"],
                      highlight: true),
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: _buildComparisonRow("OTHERS", widget.c["other"])),
                  const SizedBox(width: 20),
                  Expanded(
                      child: _buildComparisonRow(
                          "THIS BOOTCAMP", widget.c["bootcamp"],
                          highlight: true)),
                ],
              ),
      ),
    ).animate().fadeIn(duration: 700.ms).slideY(begin: 0.2);
  }

  Widget _buildComparisonRow(String label, String text,
      {bool highlight = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            color: highlight ? BootcampColor.primary : Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            color: highlight ? BootcampColor.textDark : BootcampColor.textLight,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}
