import 'package:flutter_bloc/flutter_bloc.dart';

class MyAddressScreenBloc extends Cubit<int> {
  final bool isShippingAddress;

  MyAddressScreenBloc({required this.isShippingAddress}) : super(-1);

  updateIndex(int index) {
    emit(index);
  }
}
