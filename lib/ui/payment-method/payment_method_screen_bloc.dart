import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodScreenBloc extends Cubit<int>{
  final bool isShippingAddress;

  PaymentMethodScreenBloc({required this.isShippingAddress}):super(-1);

  updateIndex(int index){
    emit(index);
  }

}