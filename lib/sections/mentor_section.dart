import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:front_flutter/core/app_color/mentor_page_color.dart';

class MentorSection extends StatelessWidget {
  const MentorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isMobile = constraints.maxWidth < 900;

        return Container(
          color: MentorPageColor.background,
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 60 : 100,
            horizontal: isMobile ? 24 : 80,
          ),
          child: isMobile
              ? _buildMobileLayout(context)
              : _buildDesktopLayout(context),
        );
      },
    );
  }

  /// 🖥 Desktop Layout
  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // 👤 Mentor Image Card
        Expanded(
          flex: 1,
          child: _buildMentorImage(),
        ).animate().fadeIn(duration: 800.ms).slideX(begin: -0.2),

        const SizedBox(width: 80),

        // 📝 Text Content
        Expanded(
          flex: 1,
          child: _buildTextContent(),
        ),
      ],
    );
  }

  /// 📱 Mobile Layout
  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildMentorImage(),
        const SizedBox(height: 40),
        _buildTextContent(isMobile: true),
      ],
    );
  }

  /// 👤 Mentor Image with Overlay
  Widget _buildMentorImage() {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: MentorPageColor.shadow,
                blurRadius: 25,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/images/tanmay-nagpal.png",
              fit: BoxFit.cover,
            ),
          ),
        ),

        // 🔸 Overlay Name Tag
        Positioned(
          bottom: 16,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  MentorPageColor.gradientStart,
                  MentorPageColor.gradientEnd,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: MentorPageColor.gradientEnd.withOpacity(0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Tanmay Nagpal",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Your Mentor",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// 📝 Text Section
  Widget _buildTextContent({bool isMobile = false}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "The Natraj Legacy",
          style: TextStyle(
            fontSize: isMobile ? 32 : 40,
            fontWeight: FontWeight.bold,
            color: MentorPageColor.title,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ).animate().fadeIn(duration: 600.ms).slideY(begin: 0.2),

        const SizedBox(height: 8),

        Text(
          "India's pioneering force in corrugated box manufacturing since 1962",
          style: TextStyle(
            fontSize: isMobile ? 16 : 18,
            color: MentorPageColor.subtitle,
          ),
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
        ).animate().fadeIn(duration: 800.ms),

        const SizedBox(height: 24),

        // 📄 Description Card
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 16 : 24,
            vertical: isMobile ? 20 : 24,
          ),
          decoration: BoxDecoration(
            color: MentorPageColor.cardBg,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: MentorPageColor.shadow,
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              style: TextStyle(
                color: MentorPageColor.subtitle,
                fontSize: isMobile ? 15 : 16,
                height: 1.6,
              ),
              children: const [
                TextSpan(
                  text: "In 1962, Tanmay Nagpal's grandfather established ",
                ),
                TextSpan(
                  text: "Natraj Industries",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      " as India's very first corrugated box machine manufacturing unit. This pioneering achievement was personally honored with a prestigious award from late Prime Minister ",
                ),
                TextSpan(
                  text: "Jawaharlal Nehru.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      "\n\nToday, as the 3rd-generation leader, Tanmay Nagpal brings over ",
                ),
                TextSpan(
                  text: "60 years of proven family expertise ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      "to help entrepreneurs build their own profitable manufacturing businesses—no textbook theory, just real-world mastery passed down through generations.",
                ),
              ],
            ),
          ),
        ).animate().fadeIn(duration: 1000.ms),

        const SizedBox(height: 32),

        // 🏅 Highlights
        Column(
          crossAxisAlignment:
              isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            _buildHighlight(
              "🏆",
              "Pioneer’s Legacy",
              "Honored by PM Nehru for establishing India’s 1st corrugated box machine unit",
              isMobile: isMobile,
            ),
            const SizedBox(height: 16),
            _buildHighlight(
              "👨‍👩‍👦",
              "3 Generations",
              "60+ years of manufacturing expertise passed down through the family",
              isMobile: isMobile,
            ),
            const SizedBox(height: 16),
            _buildHighlight(
              "⭐",
              "Proven Success",
              "Direct mentorship from the family that built the industry in India",
              isMobile: isMobile,
            ),
          ],
        ).animate().fadeIn(duration: 1200.ms),
      ],
    );
  }

  /// 🏅 Highlight Card
  Widget _buildHighlight(String emoji, String title, String description,
      {bool isMobile = false}) {
    return Container(
      width: isMobile ? double.infinity : 500,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MentorPageColor.cardBg,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: MentorPageColor.shadow,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 22)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: isMobile
                  ? CrossAxisAlignment.center
                  : CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: MentorPageColor.title,
                    fontWeight: FontWeight.w600,
                    fontSize: isMobile ? 15 : 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  textAlign: isMobile ? TextAlign.center : TextAlign.start,
                  style: TextStyle(
                    color: MentorPageColor.subtitle.withOpacity(0.9),
                    fontSize: isMobile ? 13.5 : 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
