import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/featured_character_list_cubit_cubit.dart';
import '../widgets/widgets.dart';

class CharactersPage extends StatelessWidget {
  const CharactersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => FeaturedCharacterListCubit(),
          child: const CharacterView(),
        ),
      ),
    );
  }
}

class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // final captionColor = theme.textTheme.bodyMedium?.color;
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            titleSpacing: 20,
            title: Text(
              'Daily Spotlight',
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings, size: 30),
              ),
              const SizedBox(width: 10)
            ],
          ),
          const SliverToBoxAdapter(child: FeaturedCharacterList()),
          SliverPadding(
            padding: const EdgeInsets.only(left: 20, bottom: 20),
            sliver: SliverToBoxAdapter(
              child: Text(
                'All Characters',
                style: theme.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            toolbarHeight: 0,
            bottom: TabBar(
              controller: _tabController,
              enableFeedback: true,
              tabs: const [
                Tab(icon: Icon(Icons.grid_on_rounded)),
                Tab(icon: Icon(Icons.view_agenda_outlined)),
              ],
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: const [
          SimpleCharacterGridList(),
          SimpleCharacterTileList(),
        ],
      ),
    );
  }
}
