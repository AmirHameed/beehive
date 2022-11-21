import 'package:equatable/equatable.dart';

class OrderDetailScreenBlocState extends Equatable{
  final bool isPaymentMethod;
  final bool isDeliveryAddress;


  const OrderDetailScreenBlocState({required this.isDeliveryAddress, required this.isPaymentMethod});

  const OrderDetailScreenBlocState.initial({required bool isDeliveryPayment}):this(isPaymentMethod: isDeliveryPayment,isDeliveryAddress: isDeliveryPayment);

  OrderDetailScreenBlocState copyWith({bool? isDeliveryAddress,bool?isPaymentMethod})=>OrderDetailScreenBlocState(
      isDeliveryAddress: isDeliveryAddress??this.isDeliveryAddress,
      isPaymentMethod: isPaymentMethod??this.isPaymentMethod
  );

  @override
  List<Object?> get props =>[isPaymentMethod,isDeliveryAddress];

}