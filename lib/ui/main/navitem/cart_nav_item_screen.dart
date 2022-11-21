import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/common/title_with_price_item.dart';
import 'package:beehive/ui/order-detail/order_detail_screen.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../helper/dialog_helper.dart';
import '../../common/app_button.dart';

class CartNavigationItemScreen extends StatefulWidget {
  static const String key_title = 'cart_nav_screen_key_title';
  static const String route = 'cart_nav_screen_route';
  final isBottom;

  const CartNavigationItemScreen({Key? key, this.isBottom = false})
      : super(key: key);

  @override
  State<CartNavigationItemScreen> createState() =>
      _CartNavigationItemScreenState();
}

class _CartNavigationItemScreenState extends State<CartNavigationItemScreen> {
  int count = 01;
  double value = 23.45;

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final dialogHelper = DialogHelper.instance();

    return widget.isBottom
        ? Scaffold(
            body: SafeArea(child: cardScreen(context, size,dialogHelper)),
          )
        : cardScreen(context, size,dialogHelper);
  }

  Widget cardScreen(context, size,dialogHelper) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SizedBox(height: 20),
      widget.isBottom
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
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
                  const Text(AppText.CART,
                      style: TextStyle(
                          color: Constants.colorOnSecondary,
                          fontSize: 16,
                          fontFamily: Constants.cairoBold)),
                  const SizedBox()
                ],
              ),
            )
          : const Text(AppText.CART,
              style: TextStyle(
                  color: Constants.colorOnSecondary,
                  fontSize: 22,
                  fontFamily: Constants.cairoBold)),
      const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Divider(
          thickness: 1,
          color: Constants.colorTextLight2,
          height: 1,
        ),
      ),
      Expanded(
        child: ListView.separated(
            itemCount: 3,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            scrollDirection: Axis.vertical,
            itemBuilder: (_, index) {
              return Slidable(
                endActionPane: ActionPane(
                    extentRatio: 0.3,
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                          onPressed: (_) {
                            dialogHelper
                              ..injectContext(context)
                              ..showDeleteDialogCart();
                          },
                          backgroundColor: Colors.transparent,
                          icon: Icons.delete,
                          label: '',
                          padding: const EdgeInsets.only(top: 10),
                          foregroundColor: Colors.red,
                          spacing: 0)
                    ]),
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Constants.colorOnSurface,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: Stack(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 110,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: const Image(
                                      image:
                                          AssetImage('assets/home_image1.png'),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 0, left: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Text('Beef Burgur',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Constants.colorOnSecondary,
                                        fontFamily: Constants.cairoBold)),
                                const SizedBox(height: 5),
                                const Text('Lorem ipsem Lorem ipsem',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: Constants.cairoSemibold,
                                        color: Constants.colorTextLight)),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              count = count + 1;
                                              value = 23.45 * count;
                                            });
                                          },
                                          child: Material(
                                            elevation: 8,
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            child: Container(
                                              width: 22,
                                              height: 22,
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: Container(
                                                width: 20,
                                                height: 20,
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color:
                                                        Constants.colorPrimary),
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Text(
                                              count.toString().padLeft(2, '0'),
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Constants
                                                      .colorOnSecondary)),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (count > 1) {
                                                count = count - 1;
                                                value = 23.45 * count;
                                              }
                                            });
                                          },
                                          child: Material(
                                            elevation: 8,
                                            borderRadius:
                                                BorderRadius.circular(60),
                                            child: Container(
                                              width: 22,
                                              height: 22,
                                              alignment: Alignment.center,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white,
                                              ),
                                              child: Container(
                                                width: 20,
                                                height: 20,
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Constants
                                                        .colorTextLight),
                                                child: const Icon(
                                                  Icons.remove,
                                                  color: Colors.white,
                                                  size: 18,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Text('${value.toStringAsFixed(2)}\$',
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontFamily: Constants.cairoRegular,
                                            color: Constants.colorPrimary,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
      widget.isBottom
          ? Material(
              elevation: 6,
              color: Colors.white,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    const TitleWithPriceItem(title: 'Order', value: '1.90'),
                    const TitleWithPriceItem(title: 'Fees', value: '1.90'),
                    const TitleWithPriceItem(
                        title: 'All',
                        value: '21.80',
                        style: TextStyle(
                            color: Constants.colorOnSecondary,
                            fontSize: 18,
                            fontFamily: Constants.cairoBold)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: SizedBox(
                          height: 48,
                          width: double.infinity,
                          child: AppButton(
                              onClick: () {
                                Navigator.pushNamed(
                                    context, OrderDetailScreen.route,
                                    arguments: [true, false, false]);
                              },
                              text: AppText.CONTINUE,
                              textColor: Constants.colorOnSurface,
                              borderRadius: 8.0,
                              fontSize: 16,
                              color: Constants.colorPrimary)),
                    ),
                  ],
                ),
              ),
            )
          : Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                  color: Constants.colorPrimary,
                  borderRadius: BorderRadius.circular(4)),
              child: Row(
                children: const [
                  Text('34.00 \$',
                      style: TextStyle(
                          color: Constants.colorOnPrimary,
                          fontSize: 14,
                          fontFamily: Constants.cairoRegular)),
                  SizedBox(width: 10),
                  Text(AppText.ALL,
                      style: TextStyle(
                          color: Constants.colorOnPrimary,
                          fontFamily: Constants.cairoBold,
                          fontSize: 14)),
                  Spacer(),
                  Text(AppText.COUNTINUE_THE_ORDER,
                      style: TextStyle(
                          color: Constants.colorOnPrimary,
                          fontSize: 14,
                          fontFamily: Constants.cairoRegular))
                ],
              ),
            )
    ]);
  }
}
