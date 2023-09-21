
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interstellar_insight/widgets/cubit/featured_character_list_cubit_cubit.dart';
import 'package:interstellar_insight/widgets/featured_character_list.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Characters',
            tooltip: 'Characters',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Episodes',
            tooltip: 'Episodes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Locations',
            tooltip: 'Locations',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_quote),
            label: 'Quotes',
            tooltip: 'Quotes',
          ),
        ],
        type: BottomNavigationBarType.fixed,
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
    return NestedScrollView(
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      headerSliverBuilder: (context, isInnerBoxScrolled) {
        return [
          const SliverAppBar(title: Text('Final Space')),
          const SliverToBoxAdapter(child: FeaturedCharacterList()),
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 0,
            snap: true,
            bottom: TabBar(
              controller: _tabController,
              tabs: const [
                Tab(icon: Icon(Icons.grid_on_rounded)),
                Tab(icon: Icon(Icons.list_rounded)),
              ],
            ),
          ),
        ];
      },
      body: SimpleCharacterTabView(tabController: _tabController),
    );
  }
}
