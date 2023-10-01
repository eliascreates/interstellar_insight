import 'package:flutter/material.dart';

class SimpleCharacterTabBar extends TabBar {
  const SimpleCharacterTabBar({super.key, required TabController tabController})
      : super(
          enableFeedback: true,
          controller: tabController,
          tabs: const [
            Tab(icon: Icon(Icons.grid_on_rounded)),
            Tab(icon: Icon(Icons.view_agenda_outlined)),
          ],
        );
}
