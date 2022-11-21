import 'package:beehive/ui/order-detail/order_detail_screen_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailScreenBloc extends Cubit<OrderDetailScreenBlocState> {
  final  isOrderDetail;
  final  isProviderOffer;
  final  isDeliveryPayment;

  OrderDetailScreenBloc({this.isOrderDetail = false,this.isProviderOffer=false,this.isDeliveryPayment=false})
      : super(OrderDetailScreenBlocState.initial(isDeliveryPayment: isDeliveryPayment));


  void updateDeliveryAddress(bool value) {
    emit(state.copyWith(isDeliveryAddress: value));
  }

  void updatePaymentMethod(bool value) {
    emit(state.copyWith(isPaymentMethod: value));
  }
}
