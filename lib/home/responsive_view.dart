import 'package:flutter/material.dart';
import 'package:front_flutter/home/desktop_view.dart';
import 'package:front_flutter/home/mobile_view.dart';

// Responsive breakpoints for web SPA
const int _kDesktopBreakpoint = 780;

class ResponsiveView extends StatelessWidget {
  const ResponsiveView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Determines which view to show based on screen width
    return screenWidth < _kDesktopBreakpoint
        ? const MobileView()
        : const DesktopView();
  }
}
