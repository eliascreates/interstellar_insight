import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interstellar_insight/home/cubit/home_cubit.dart';
import 'package:interstellar_insight/view/character_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeBody(),
      bottomNavigationBar: _BottomNavigationBar(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  const _HomeBody();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeCubit>().state;

    switch (state) {
      case HomeState.characters:
        return const CharacterPage();
      case HomeState.episodes:
        return Center(
            child: Text(
          'Episode Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ));
      case HomeState.locations:
        return Center(
            child: Text(
          'Locations Page',
          style: Theme.of(context).textTheme.headlineLarge,
        ));
      case HomeState.quotes:
        return Center(
            child: Text(
          'Quotes Page',
          style: Theme.of(context).textTheme.headlineMedium,
        ));
    }
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeCubit>().state;
    return BottomNavigationBar(
      onTap: (index) => context.read<HomeCubit>().toggleTab(index),
      currentIndex: state.index,
      enableFeedback: true,
      showUnselectedLabels: false,
      selectedLabelStyle: const TextStyle(fontSize: 12),
      unselectedItemColor: Theme.of(context).unselectedWidgetColor,
      selectedItemColor: Theme.of(context).primaryColor,
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
    );
  }
}
