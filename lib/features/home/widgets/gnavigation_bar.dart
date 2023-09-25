import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../cubit/home_cubit.dart';

class GNavigationBar extends StatelessWidget {
  const GNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeCubit>().state;
    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    return GNav(
        onTabChange: (index) => context.read<HomeCubit>().toggleTab(index),
        selectedIndex: state.index,
        gap: 8,
        backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor ??
            Colors.transparent,
        color: theme.unselectedWidgetColor,
        activeColor: primaryColor,
        iconSize: 24,
        textSize: 12,
        tabBackgroundColor: primaryColor.withOpacity(0.1),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
        tabMargin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        tabs: const [
          GButton(icon: Icons.people, text: 'Characters'),
          GButton(icon: Icons.tv, text: 'Episodes'),
          GButton(icon: Icons.location_on, text: 'Locations'),
          GButton(icon: Icons.format_quote, text: 'Quotes'),
        ]);
  }
}
