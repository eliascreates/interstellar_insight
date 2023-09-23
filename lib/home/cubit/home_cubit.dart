import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'home_state.dart';

class HomeCubit extends HydratedCubit<HomeState> {
  HomeCubit() : super(HomeState.characters);

  void toggleTab(int index) => emit(HomeState.values.elementAt(index));

  @override
  HomeState? fromJson(Map<String, dynamic> json) {
    return HomeState.values.elementAt(json['index'] as int);
  }

  @override
  Map<String, dynamic>? toJson(HomeState state) => {'index': state.index};
}
