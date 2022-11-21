import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryDetailScreenBloc extends Cubit<int>{
  CategoryDetailScreenBloc():super(0);

  void updateHomeIndex(index) {
    if (index != index) {
      emit(index);
    }
  }

}