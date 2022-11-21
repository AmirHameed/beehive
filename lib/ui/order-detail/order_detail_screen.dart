import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/chat_screen.dart';
import 'package:beehive/ui/common/app_button.dart';
import 'package:beehive/ui/common/app_text_field.dart';
import 'package:beehive/ui/common/title_with_price_item.dart';
import 'package:beehive/ui/my_address_screen.dart';
import 'package:beehive/ui/order-detail/order_detail_screen_bloc.dart';
import 'package:beehive/ui/order-detail/order_detail_screen_bloc_state.dart';
import 'package:beehive/ui/payment_method_screen.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../helper/dialog_helper.dart';

class OrderDetailScreen extends StatelessWidget {
  static const String route = 'order_detail_screen_route';

  const OrderDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final bloc = context.read<OrderDetailScreenBloc>();
    final dialogHelper = DialogHelper.instance();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 22,
                          color: Constants.colorOnSecondary,
                        )),
                    Text(
                        bloc.isOrderDetail
                            ? AppText.COUNTINUE_THE_ORDER
                            : 'Order ID #1234',
                        style: const TextStyle(
                            color: Constants.colorOnSecondary,
                            fontSize: 16,
                            fontFamily: Constants.cairoBold)),
                    const SizedBox()
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Divider(
                  thickness: 1,
                  color: Constants.colorTextLight2,
                  height: 1,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(width: 1, color: Constants.colorTextLight3)),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(AppText.ORDER_ITEMS,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: Constants.cairoBold,
                                  color: Constants.colorOnSecondary)),
                          bloc.isOrderDetail
                              ? BlocBuilder<OrderDetailScreenBloc,
                                  OrderDetailScreenBlocState>(
                                  builder: (_, state) => Text(
                                      state.isPaymentMethod &&
                                              state.isDeliveryAddress
                                          ? ' Hamada restaurant'
                                          : '',
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color: Constants.colorPrimary,
                                          fontFamily: Constants.cairoSemibold)),
                                )
                              : const SizedBox(),
                          const Spacer(),
                          const Icon(Icons.arrow_forward_ios_rounded,
                              color: Constants.colorTextLight, size: 18)
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 1,
                      color: Constants.colorTextLight3,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset('assets/home_image1.png',
                                      width: 50, height: 60)),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Beef burger',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Constants.colorOnSecondary,
                                          fontFamily: Constants.cairoSemibold)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text('Quantity ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  Constants.cairoRegular,
                                              color: Constants.colorTextLight)),
                                      Text('2',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Constants.colorPrimary,
                                              fontFamily:
                                                  Constants.cairoRegular)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('1.90',
                                  style: TextStyle(
                                      color: Constants.colorOnSecondary,
                                      fontSize: 14,
                                      fontFamily: Constants.cairoBold)),
                              Image.asset('assets/dollar.png',
                                  height: 10, width: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        thickness: 1,
                        height: 1,
                        color: Constants.colorTextLight3,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset('assets/home_image1.png',
                                      width: 50, height: 60)),
                              const SizedBox(width: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Beef burger',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Constants.colorOnSecondary,
                                          fontFamily: Constants.cairoSemibold)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: const [
                                      Text('Quantity ',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontFamily:
                                                  Constants.cairoRegular,
                                              color: Constants.colorTextLight)),
                                      Text('2',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Constants.colorPrimary,
                                              fontFamily:
                                                  Constants.cairoRegular)),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('1.90',
                                  style: TextStyle(
                                      color: Constants.colorOnSecondary,
                                      fontSize: 14,
                                      fontFamily: Constants.cairoBold)),
                              Image.asset('assets/dollar.png',
                                  height: 10, width: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final result = await Navigator.pushNamed(
                      context, MyAddressScreen.route,
                      arguments: true);
                  if (result == true) {
                    bloc.updateDeliveryAddress(true);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 1, color: Constants.colorTextLight3)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(AppText.DELIVERY_ADDRESS,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Constants.colorOnSecondary,
                                    fontFamily: Constants.cairoBold)),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: Constants.colorTextLight, size: 18)
                          ],
                        ),
                      ),
                      BlocBuilder<OrderDetailScreenBloc,
                          OrderDetailScreenBlocState>(
                        buildWhen: (previous, current) =>
                            previous.isDeliveryAddress !=
                            current.isDeliveryAddress,
                        builder: (_, state) => state.isDeliveryAddress
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Divider(
                                    thickness: 1,
                                    height: 1,
                                    color: Constants.colorTextLight3,
                                  ),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children:  [
                                        Image.asset('assets/map.png',
                                            width: size.width,
                                            height: 200,
                                            fit: BoxFit.cover),
                                        Text(
                                            'King Faisal Street, Riyadh, Saudi Arabia',
                                            style: TextStyle(
                                                fontFamily:
                                                    Constants.cairoRegular)),
                                        Text(
                                          '+966567112233',
                                          style: TextStyle(
                                              fontFamily: Constants.cairoRegular),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  final result = await Navigator.pushNamed(
                      context, PaymentMethodScreen.route);
                  if (result == true) {
                    bloc.updatePaymentMethod(true);
                  }
                },
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          width: 1, color: Constants.colorTextLight3)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(AppText.PAYMENT_METHOD,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Constants.colorOnSecondary,
                                    fontFamily: Constants.cairoBold)),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: Constants.colorTextLight, size: 18)
                          ],
                        ),
                      ),
                      BlocBuilder<OrderDetailScreenBloc,
                          OrderDetailScreenBlocState>(
                        buildWhen: (previous, current) =>
                            previous.isPaymentMethod != current.isPaymentMethod,
                        builder: (_, state) => state.isPaymentMethod
                            ? Column(
                                children: [
                                  const Divider(
                                    thickness: 1,
                                    height: 1,
                                    color: Constants.colorTextLight3,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text('**** **** **** 6544',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Constants
                                                        .colorOnSecondary,
                                                    fontFamily: Constants.cairoSemibold)),
                                            SizedBox(height: 20),
                                            Text('12/23',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Constants
                                                        .colorOnSecondary,
                                                    fontFamily: Constants.cairoSemibold))
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Image.asset('assets/visa.png',
                                                width: 70, height: 40),
                                            const SizedBox(height: 10),
                                            const Text('Expired',
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Constants
                                                        .colorOnSecondary,
                                                    fontFamily: Constants.cairoSemibold))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(AppText.NOTES,
                      style: TextStyle(
                          fontSize: 16,
                          color: Constants.colorOnSecondary,
                          fontFamily: Constants.cairoBold)),
                ),
              ),
              bloc.isOrderDetail
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      child: BlocBuilder<OrderDetailScreenBloc,
                              OrderDetailScreenBlocState>(
                          builder: (_, state) => AppTextField(
                                isError: false,
                                readOnly: state.isDeliveryAddress &&
                                        state.isPaymentMethod
                                    ? true
                                    : false,
                                hint: AppText.WRITE_YOUR_NOTES,
                                textInputType: TextInputType.text,
                                maxLine: 4,
                                onChanged: (value) {},
                                controller: TextEditingController(
                                    text: state.isDeliveryAddress &&
                                            state.isPaymentMethod
                                        ? 'Lorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsum'
                                        : ''),
                              )))
                  : Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              width: 1, color: Constants.colorTextLight3)),
                      child: const Text(
                          'Lorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsumLorem ipsum Lorem ipsum',
                          style:
                              TextStyle(fontFamily: Constants.cairoRegular))),
              bloc.isOrderDetail
                  ? Material(
                      elevation: 6,
                      color: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          children: [
                            const TitleWithPriceItem(
                                title: 'Order', value: '19.90'),
                            const TitleWithPriceItem(
                                title: 'Fees', value: '1.90'),
                            bloc.isProviderOffer
                                ? const TitleWithPriceItem(
                                    title: 'Delivery', value: '1.90')
                                : const SizedBox(),
                            const TitleWithPriceItem(
                                title: 'All',
                                value: '21.80',
                                style: TextStyle(
                                    color: Constants.colorOnSecondary,
                                    fontSize: 18,
                                    fontFamily: Constants.cairoBold)),
                            BlocBuilder<OrderDetailScreenBloc,
                                OrderDetailScreenBlocState>(
                              builder: (_, state) => SizedBox(
                                  height: 48,
                                  width: double.infinity,
                                  child: AppButton(
                                      onClick: () {
                                        if (state.isPaymentMethod &&
                                            state.isDeliveryAddress) {
                                          if (bloc.isProviderOffer) {
                                            return Navigator.pushNamed(
                                                context, ChatScreen.route);
                                          }
                                          dialogHelper
                                            ..injectContext(context)
                                            ..showRequestSentDialog(() =>
                                                dialogHelper
                                                    .showDeleteDialog());
                                        }
                                      },
                                      text: AppText.CONFIRM,
                                      textColor: state.isPaymentMethod &&
                                              state.isDeliveryAddress
                                          ? Constants.colorOnSurface
                                          : Constants.colorOnSurface
                                              .withOpacity(0.7),
                                      borderRadius: 8.0,
                                      fontSize: 16,
                                      color: state.isPaymentMethod &&
                                              state.isDeliveryAddress
                                          ? Constants.colorPrimary
                                          : Constants.colorPrimaryLight)),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              width: 1, color: Constants.colorTextLight3)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Bill',
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Constants.colorOnSecondary,
                                        fontFamily: Constants.cairoBold)),
                              ],
                            ),
                          ),
                          const Divider(
                            thickness: 1,
                            height: 1,
                            color: Constants.colorTextLight3,
                          ),
                          const TitleWithPriceItem(
                              title: 'Order', value: '1.90'),
                          const TitleWithPriceItem(
                              title: 'Fees', value: '1.90'),
                          const TitleWithPriceItem(
                              title: 'All',
                              value: '21.80',
                              style: TextStyle(
                                  color: Constants.colorOnSecondary,
                                  fontSize: 18,
                                  fontFamily: Constants.cairoBold)),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
