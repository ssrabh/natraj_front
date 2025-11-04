import 'package:flutter/material.dart';
import 'package:front_flutter/core/app_color.dart';
import 'package:front_flutter/core/navigation.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // --- Scrollable content ---
          CustomScrollView(
            controller: NavModel.scrollController,
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  NavModel.sections.map((item) {
                    return AutoScrollTag(
                      key: item.key,
                      controller: NavModel.scrollController,
                      index: item.index,
                      child: item.section,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),

          // --- Fixed top navigation bar ---
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 100),
              color: Colors.white.withOpacity(0.95),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Brand name or logo
                  const Text(
                    "Natraj Industry",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ).animate().fadeIn(duration: 500.ms),

                  // Menu items from NavModel
                  Row(
                    children: NavModel.sections.map((item) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: InkWell(
                          onTap: () => NavModel.scrollTo(item.index),
                          hoverColor: AppColors.secondary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              item.title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
