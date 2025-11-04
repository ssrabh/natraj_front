import 'package:flutter/material.dart';
import 'package:front_flutter/sections/about_section.dart';
import 'package:front_flutter/sections/home_section.dart';
import 'package:front_flutter/sections/ss.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

// Data model for a single navigation item/section
class NavItem {
  final String title;
  final String route;
  final Key key;
  final int index;
  final Widget section; // 👈 new field: direct reference to the section widget

  NavItem({
    required this.title,
    required this.route,
    required this.key,
    required this.index,
    required this.section,
  });
}

// Manages the state and logic for all SPA sections
class NavModel {
  // AutoScrollController for smooth scrolling
  static final AutoScrollController scrollController = AutoScrollController();

  // Define all SPA sections in order
  static final List<NavItem> sections = [
    NavItem(
      title: 'Home',
      route: '/',
      key: const ValueKey(0),
      index: 0,
      section: const HomeSection(),
    ),
    NavItem(
      title: 'About Us',
      route: '/about',
      key: const ValueKey(1),
      index: 1,
      section: const AboutSection(),
    ),
    NavItem(
      title: "SS",
      route: '/ss',
      key: const ValueKey(2),
      index: 2,
      section: const SSsec(),
    ),
  ];

  // Smooth scroll to a section by its index
  static Future<void> scrollTo(int index) async {
    await scrollController.scrollToIndex(
      index,
      preferPosition: AutoScrollPosition.begin,
      duration: const Duration(milliseconds: 800),
    );
  }
}
