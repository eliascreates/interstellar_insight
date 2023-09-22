import 'package:flutter/material.dart';
import 'package:interstellar_insight/widgets/simple_character_grid_list.dart';
import 'package:interstellar_insight/widgets/simple_character_tile_list.dart';

class SimpleCharacterTabView extends StatelessWidget {
  const SimpleCharacterTabView({super.key, required this.tabController, required this.nestedScrollController});
  final ScrollController nestedScrollController; 

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: tabController,
      children: [
        SimpleCharacterGridList(scrollController: nestedScrollController),
        SimpleCharacterTileList(scrollController: nestedScrollController),
      ],
    );
  }
}
