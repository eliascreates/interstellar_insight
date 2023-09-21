import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedCharacterListCubit extends Cubit<double> {
  FeaturedCharacterListCubit() : super(0);

  void handlePageChange(double currentPage) => emit(currentPage);
}
