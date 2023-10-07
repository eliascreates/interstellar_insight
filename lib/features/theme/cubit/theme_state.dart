part of 'theme_cubit.dart';

enum ThemeState { light, dark }

extension ThemeStateX on ThemeState {
  ThemeMode mode() {
    return this == ThemeState.light ? ThemeMode.light : ThemeMode.dark;
  }
}
