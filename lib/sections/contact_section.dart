import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:front_flutter/core/app_color/footer_page_color.dart';
import 'package:front_flutter/widgets/utils.dart';
import 'package:front_flutter/sections/form_page.dart'; // ✅ Your existing form page

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      color: FooterColor.background,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 60),
      child: Column(
        children: [
          // 🧩 Top content (3 columns)
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCompanyInfo(),
                    const SizedBox(height: 40),
                    _buildContactInfo(),
                    const SizedBox(height: 40),
                    _buildQuickLinks(context),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildCompanyInfo()),
                    const SizedBox(width: 60),
                    Expanded(child: _buildContactInfo()),
                    const SizedBox(width: 60),
                    Expanded(child: _buildQuickLinks(context)),
                  ],
                ),

          const SizedBox(height: 50),
          Divider(color: FooterColor.divider, thickness: 1),

          // ⚖️ Bottom row
          const SizedBox(height: 30),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "© 2025 Natraj Industries. All rights reserved.",
                      style: TextStyle(
                        color: FooterColor.text.withOpacity(0.85),
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Pioneering Indian Manufacturing Since 1962",
                      style: TextStyle(
                        color: FooterColor.text.withOpacity(0.7),
                        fontSize: 13,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "© 2025 Natraj Industries. All rights reserved.",
                      style: TextStyle(
                        color: FooterColor.text.withOpacity(0.85),
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      "Pioneering Indian Manufacturing Since 1962",
                      style: TextStyle(
                        color: FooterColor.text.withOpacity(0.7),
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }

  // 🏭 Company info block
  Widget _buildCompanyInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Natraj Industries",
          style: TextStyle(
            color: FooterColor.text,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "India's pioneering force in corrugated box manufacturing since 1962. "
          "Honored by PM Jawaharlal Nehru for establishing the nation's first unit.",
          style: TextStyle(
            color: FooterColor.text.withOpacity(0.85),
            fontSize: 15,
            height: 1.6,
          ),
        ),
      ],
    ).animate().fadeIn(duration: 700.ms).slideY(begin: 0.2);
  }

  // 📞 Contact info block
  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact Us",
          style: TextStyle(
            color: FooterColor.text,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        _contactItem(Icons.email_outlined, "info@natrajindustries.com"),
        const SizedBox(height: 12),
        _contactItem(Icons.phone_outlined, "+91 98765 43210"),
        const SizedBox(height: 12),
        _contactItem(
            Icons.location_on_outlined, "Industrial Area, New Delhi, India"),
      ],
    ).animate().fadeIn(duration: 900.ms).slideY(begin: 0.2);
  }

  Widget _contactItem(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: FooterColor.accent, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: FooterColor.text.withOpacity(0.9),
              fontSize: 15,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  // 🔗 Quick links block (updated to handle navigation)
  Widget _buildQuickLinks(BuildContext context) {
    final links = {
      "About the Legacy": const MockPage(title: "About the Legacy"),
      "Enroll Now": const FormPage(),
      "Privacy Policy": const MockPage(title: "Privacy Policy"),
      "Terms & Conditions": const MockPage(title: "Terms & Conditions"),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Quick Links",
          style: TextStyle(
            color: FooterColor.text,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 20),
        ...links.entries.map(
          (entry) => _AnimatedLink(
            text: entry.key,
            onTap: () => Utils.pushPage(context, entry.value, fade: true),
          ),
        ),
      ],
    ).animate().fadeIn(duration: 1000.ms).slideY(begin: 0.2);
  }
}

// 🌈 Interactive hover link
class _AnimatedLink extends StatefulWidget {
  final String text;
  final VoidCallback? onTap;

  const _AnimatedLink({required this.text, this.onTap});

  @override
  State<_AnimatedLink> createState() => _AnimatedLinkState();
}

class _AnimatedLinkState extends State<_AnimatedLink> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      hoverColor: Colors.transparent,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hover = true),
        onExit: (_) => setState(() => _hover = false),
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: _hover ? 10 : 0,
                height: 2,
                color: FooterColor.accent,
                margin: const EdgeInsets.only(right: 8),
              ),
              Text(
                widget.text,
                style: TextStyle(
                  color: _hover ? FooterColor.linkHover : FooterColor.text,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 🧱 Simple mock pages for other links
class MockPage extends StatelessWidget {
  final String title;
  const MockPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          "$title Page (Coming Soon)",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
