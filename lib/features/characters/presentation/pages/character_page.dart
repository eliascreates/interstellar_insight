import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interstellar_insight/features/characters/presentation/cubit/featured_character_list_cubit_cubit.dart';
import 'package:interstellar_insight/features/characters/presentation/widgets/featured_character_list.dart';

import '../widgets/simple_character_tab_view.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({super.key});

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
  final _scrollController = ScrollController();
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
    return NestedScrollView(
      controller: _scrollController,
      floatHeaderSlivers: true,
      headerSliverBuilder: (context, isInnerBoxScrolled) {
        return [
          const SliverAppBar(title: Text('Final Space')),
          const SliverToBoxAdapter(child: FeaturedCharacterList()),
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
      body: SimpleCharacterTabView(
        tabController: _tabController,
        nestedScrollController: _scrollController,
      ),
    );
  }
}
