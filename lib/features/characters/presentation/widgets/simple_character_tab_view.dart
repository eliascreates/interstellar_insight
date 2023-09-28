part of 'simple_character_tab_bar.dart';

class SimpleCharacterTabView extends StatelessWidget {
  const SimpleCharacterTabView({
    super.key,
    required this.tabController,
    required this.nestedScrollController,
  });
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
