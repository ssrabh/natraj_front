import 'package:flutter/material.dart';
import 'package:front_flutter/sections/contact_section.dart';
import 'package:front_flutter/sections/home_section.dart';
import 'package:front_flutter/sections/mentor_section.dart';
import 'package:front_flutter/sections/program_section.dart';
import 'package:front_flutter/sections/wjbc_section.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

// Data model for a single navigation item/section
class NavItem {
  final String title;
  final String route;
  final Key key;
  final int index;
  final Widget section;

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
      title: 'About',
      route: '/',
      key: const ValueKey(0),
      index: 0,
      section: const HomeSection(),
    ),
    NavItem(
      title: "Mentor",
      route: '/mentor',
      key: const ValueKey(1),
      index: 1,
      section: const MentorSection(),
    ),
    NavItem(
      title: "Program",
      route: '/program',
      key: const ValueKey(2),
      index: 2,
      section: const ProgramSection(),
    ),
    NavItem(
        title: 'Why Join This Bootcamp',
        route: '/why-join',
        key: const ValueKey(3),
        index: 3,
        section: const WhyJoinBootcampSection()),
    NavItem(
        title: 'Contact',
        route: '/contact',
        key: const ValueKey(4),
        index: 4,
        section: const ContactSection())
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
