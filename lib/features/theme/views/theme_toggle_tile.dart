import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interstellar_insight/features/theme/cubit/theme_cubit.dart';

class ThemeToggleTitle extends StatelessWidget {
  const ThemeToggleTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    final title = themeState == ThemeState.light ? 'Light Theme' : 'Dark Theme';

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: SwitchListTile(
        onChanged: (_) => context.read<ThemeCubit>().toggleTheme(),
        value: themeState == ThemeState.light,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        title: Text(title),
        secondary: AnimatedRotation(
          turns: themeState == ThemeState.light ? 1 : 0,
          duration: const Duration(milliseconds: 1200),
          child: AnimatedCrossFade(
            firstChild: const Icon(Icons.light_mode),
            secondChild: const Icon(Icons.dark_mode),
            firstCurve: Curves.easeInOutSine,
            secondCurve: Curves.easeInOutSine,
            crossFadeState: themeState == ThemeState.light
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 1100),
          ),
        ),
      ),
    );
  }
}
