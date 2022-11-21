import 'package:flutter_bloc/flutter_bloc.dart';

class OrderScreenBloc extends Cubit<int>{
  OrderScreenBloc():super(0);

  void updateIndex(int value){
    emit(value);
  }

}