import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/helper/dialog_helper.dart';
import 'package:beehive/ui/chat_screen.dart';
import 'package:beehive/ui/order/order_screen_bloc.dart';
import 'package:beehive/ui/order-detail/order_detail_screen.dart';
import 'package:beehive/ui/order_tracking_screen.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/app_bar.dart';
import '../common/title_with_price_item.dart';

class OrderScreen extends StatelessWidget {
  static const String route = 'order_screen_route';

  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    final bloc = context.read<OrderScreenBloc>();
    final dialogHelper = DialogHelper.instance();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarItem(title: AppText.MY_ORDERS),
            BlocBuilder<OrderScreenBloc, int>(
              buildWhen: (previous, current) => previous != current,
              builder: (_, index) => Container(
                height: 60,
                width: size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Constants.colorLightPink),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => bloc.updateIndex(0),
                        child: Container(
                          alignment: Alignment.center,
                          height: 65,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: index == 0
                                  ? Constants.colorPrimary
                                  : Colors.transparent),
                          child: Text(AppText.NEW,
                              style: TextStyle(
                                  color: index == 0
                                      ? Colors.white
                                      : Constants.colorPrimary,
                                  fontFamily: Constants.cairoRegular,
                                  fontSize: 14)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => bloc.updateIndex(1),
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: index == 1
                                  ? Constants.colorPrimary
                                  : Colors.transparent),
                          child: Text(AppText.COMPLETED,
                              style: TextStyle(
                                  color: index == 1
                                      ? Colors.white
                                      : Constants.colorPrimary,
                                  fontFamily: Constants.cairoRegular,
                                  fontSize: 14)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => bloc.updateIndex(2),
                        child: Container(
                          alignment: Alignment.center,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: index == 2
                                  ? Constants.colorPrimary
                                  : Colors.transparent),
                          child: Text(
                            AppText.CANCELLED,
                            style: TextStyle(
                                color: index == 2
                                    ? Colors.white
                                    : Constants.colorPrimary,
                                fontFamily: Constants.cairoRegular,
                                fontSize: 14),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            BlocBuilder<OrderScreenBloc, int>(
              buildWhen: (previous, current) => previous != current,
              builder: (_, index) => Expanded(
                  child: index == 0
                      ? Column(
                          children:  [
                            GestureDetector(
                                onTap: ()=>Navigator.pushNamed(
                                    context, OrderDetailScreen.route,
                                    arguments: [false, false, true]),
                                child: const _SingleOrderItemWidget(title: AppText.NEW)),
                            GestureDetector(
                                onTap: ()=>Navigator.pushNamed(
                                    context, OrderDetailScreen.route,
                                    arguments: [false, false, true]),child: const _SingleOrderItemWidget(title: AppText.NEW)),
                          ],
                        )
                      : index == 1
                          ? Column(
                              children:  [
                                GestureDetector(
                                  onTap: ()=>Navigator.pushNamed(
                                      context, OrderDetailScreen.route,
                                      arguments: [false, false, true]),
                                  child: const _SingleOrderItemWidget(
                                      title: AppText.COMPLETED),
                                ),
                                GestureDetector(
                                  onTap: ()=>Navigator.pushNamed(
                                      context, OrderDetailScreen.route,
                                      arguments: [false, false, true]),
                                  child: const _SingleOrderItemWidget(
                                      title: AppText.COMPLETED),
                                ),
                              ],
                            )
                          : Column(
                              children:  [
                                GestureDetector(
                                  onTap: ()=>Navigator.pushNamed(
                                      context, OrderDetailScreen.route,
                                      arguments: [false, false, true]),
                                  child: const _SingleOrderItemWidget(
                                      title: AppText.CANCELLED),
                                ),
                                GestureDetector(
                                  onTap: ()=>Navigator.pushNamed(
                                      context, OrderDetailScreen.route,
                                      arguments: [false, false, true]),
                                  child: const _SingleOrderItemWidget(
                                      title: AppText.CANCELLED),
                                ),
                              ],
                            )),
            )
          ],
        ),
      ),
    );
  }
}

class _SingleOrderItemWidget extends StatelessWidget {
  final String title;

  const _SingleOrderItemWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    final dialogHelper = DialogHelper.instance();
    final size = context.screenSize;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: Constants.colorTextLight3)),
      child: Column(
        children: [
          OrderBoxHeader(title: title),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Date',
                    style: TextStyle(
                        fontSize: 14,
                        color: Constants.colorTextLight,
                        fontFamily: Constants.cairoRegular)),
                Text('20/10/2022',
                    style: TextStyle(
                        fontSize: 14,
                        color: Constants.colorOnSecondary,
                        fontFamily: Constants.cairoSemibold))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text('Amount',
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 14,
                        color: Constants.colorTextLight,
                        fontFamily: Constants.cairoRegular)),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('1.90',
                        style: TextStyle(
                            color: Constants.colorOnSecondary,
                            fontSize: 14,
                            fontFamily: Constants.cairoSemibold)),
                    Image.asset('assets/dollar.png', height: 10, width: 10),
                  ],
                ),
              ],
            ),
          ),
          title == AppText.NEW
              ? OrderButtonWidget(
                  firstButton: () =>
                      Navigator.pushNamed(context, ChatScreen.route),
                  firstText: AppText.CHAT,
                  lastButton: () =>
                      Navigator.pushNamed(context, OrderTrackingScreen.route),
                  lastText: AppText.ORDER_TRACKING)
              : title == AppText.COMPLETED
                  ? OrderButtonWidget(
                      lastButton: () => Navigator.pushNamed(
                          context, OrderDetailScreen.route,
                          arguments: [true, false, false]),
                      lastText: AppText.RE_ORDER,
                      firstButton: () => dialogHelper
                        ..injectContext(context)
                        ..showWriteReviewDialog((text) {}),
                      firstText: AppText.REVIEW)
                  : GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, OrderDetailScreen.route,
                          arguments: [true, false, false]),
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        alignment: Alignment.center,
                        height: 48,
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                width: 1, color: Constants.colorPrimary),
                            color: Constants.colorPrimary),
                        child: const Text(AppText.RE_ORDER,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontFamily: Constants.cairoRegular)),
                      ),
                    )
        ],
      ),
    );
  }
}

class OrderBoxHeader extends StatelessWidget {
  final String title;

  const OrderBoxHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Order ID #1234',
                  style: TextStyle(
                      fontSize: 14,
                      color: Constants.colorOnSecondary,
                      fontFamily: Constants.cairoBold)),
              Row(
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 14,
                          color: title == AppText.NEW
                              ? Constants.colorIcon
                              : title == AppText.COMPLETED
                                  ? Constants.colorGreen
                                  : Constants.colorError,
                          fontFamily: Constants.cairoRegular)),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Constants.colorTextLight,
                  )
                ],
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
          height: 1,
          color: Constants.colorTextLight3,
        ),
      ],
    );
  }
}

class OrderButtonWidget extends StatelessWidget {
  final String firstText;
  final String lastText;
  final VoidCallback firstButton;
  final VoidCallback lastButton;

  const OrderButtonWidget(
      {required this.firstText,
      required this.lastText,
      required this.firstButton,
      required this.lastButton});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: firstButton,
              child: Container(
                alignment: Alignment.center,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border:
                        Border.all(width: 1, color: Constants.colorPrimary)),
                child: Text(firstText,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Constants.colorPrimary,
                        fontFamily: Constants.cairoRegular)),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: lastButton,
              child: Container(
                alignment: Alignment.center,
                height: 48,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Constants.colorPrimary),
                    color: Constants.colorPrimary),
                child: Text(lastText,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: Constants.cairoRegular)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
