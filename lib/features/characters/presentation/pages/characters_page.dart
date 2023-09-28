import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/characters_bloc.dart';
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
    final theme = Theme.of(context);

    return BlocBuilder<CharactersBloc, CharactersState>(
        builder: (context, state) {
      if (state.characters.isEmpty) {
        return Center(
          child: CircularProgressIndicator(
            color: theme.colorScheme.primary,
          ),
        );
      }

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
              bottom: SimpleCharacterTabBar(tabController: _tabController),
            ),
          ];
        },
        body: SimpleCharacterTabView(
          tabController: _tabController,
          nestedScrollController: _scrollController,
        ),
      );
    });
  }
}
