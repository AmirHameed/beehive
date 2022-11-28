import 'package:equatable/equatable.dart';

class OrderDetailScreenBlocState extends Equatable{
  final bool isPaymentMethod;
  final bool isDeliveryAddress;
  final int paymentMethodSelected;


  const OrderDetailScreenBlocState({required this.isDeliveryAddress, required this.isPaymentMethod,required this.paymentMethodSelected});

  const OrderDetailScreenBlocState.initial({required bool isDeliveryPayment}):this(isPaymentMethod: isDeliveryPayment,isDeliveryAddress: isDeliveryPayment,paymentMethodSelected: -1);

  OrderDetailScreenBlocState copyWith({bool? isDeliveryAddress,bool?isPaymentMethod,int? paymentMethodSelected})=>OrderDetailScreenBlocState(
      isDeliveryAddress: isDeliveryAddress??this.isDeliveryAddress,
      isPaymentMethod: isPaymentMethod??this.isPaymentMethod,
      paymentMethodSelected:paymentMethodSelected??this.paymentMethodSelected
  );

  @override
  List<Object?> get props =>[isPaymentMethod,isDeliveryAddress,paymentMethodSelected];

}