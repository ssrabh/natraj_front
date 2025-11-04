import 'package:flutter/material.dart';

import 'package:front_flutter/core/navigation.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Natraj Industry',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            //  color: AppColors.primary,
          ),
        ),
        // backgroundColor: AppColors.light,
        elevation: 4,
        // iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              //  decoration: BoxDecoration(color: AppColors.primary),
              child: Text(
                'Natraj Industry \n keeping India Moving',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
            ...NavModel.sections.map((item) {
              return ListTile(
                title: Text(item.title),
                onTap: () {
                  Navigator.pop(context); // close drawer
                  NavModel.scrollTo(item.index);
                },
              );
            }),
          ],
        ),
      ),
      body: ListView.builder(
        controller: NavModel.scrollController,
        itemCount: NavModel.sections.length,
        itemBuilder: (context, index) {
          final item = NavModel.sections[index];
          return AutoScrollTag(
            key: item.key,
            controller: NavModel.scrollController,
            index: item.index,
            child: item.section,
          );
        },
      ),
    );
  }
}
