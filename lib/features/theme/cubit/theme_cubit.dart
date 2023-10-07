import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(ThemeState.light);

  void toggleTheme() {
    emit(state == ThemeState.light ? ThemeState.dark : ThemeState.light);
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.values[json['index'] as int];
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return {'index': state.index};
  }
}
