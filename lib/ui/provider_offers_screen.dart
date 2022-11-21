import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/choose_delivery_address_screen.dart';
import 'package:beehive/ui/common/app_button.dart';
import 'package:beehive/ui/chat_screen.dart';
import 'package:beehive/ui/order-detail/order_detail_screen.dart';
import 'package:beehive/ui/reviews_screen.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProviderOfferScreen extends StatelessWidget {
  static const String route = 'providers_offers_screen_route';
  const ProviderOfferScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return true;
        },
        child: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context, true),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 22,
                        color: Constants.colorOnSecondary,
                      )),
                  const Text(AppText.PROVIDERS_OFFERS,
                      style: TextStyle(
                          color: Constants.colorOnSecondary,
                          fontSize: 16,
                          fontFamily: Constants.cairoBold)),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(AppText.CANCEL_ORDER,
                        style: TextStyle(
                            color: Constants.colorError,
                            fontSize: 12,
                            fontFamily: Constants.cairoSemibold)),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Divider(
                thickness: 1,
                color: Constants.colorTextLight2,
                height: 1,
              ),
            ),
            Container(
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
                      children:  [
                        Image.asset('assets/profile_image.png', width: 40, height: 40),

                        const SizedBox(width: 8),
                        const Text('Amir',
                            style: TextStyle(
                                fontSize: 14,
                                color: Constants.colorOnSecondary,
                                fontFamily: Constants.cairoBold)),

                        const Spacer(),
                        GestureDetector(
                          onTap: ()=>Navigator.pushNamed(context, ReviewsScreen.route),
                          child: const Text('4.5',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Constants.colorOnSecondary,
                                  fontFamily: Constants.cairoRegular)),
                        ),
                        Image.asset('assets/full.png', width: 10, height: 10),

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
                        vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Away from you',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 14,
                                color: Constants.colorOnSecondary,
                                fontFamily: Constants.cairoRegular)),
                        Text('5 km',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 14,
                                color: Constants.colorOnSecondary,
                                fontFamily: Constants.cairoBold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Delivery time',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 14,
                                color: Constants.colorOnSecondary,
                                fontFamily: Constants.cairoRegular)),
                        Text('1 hour',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 14,
                                color: Constants.colorOnSecondary,
                                fontFamily: Constants.cairoBold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  const [
                        Text('Delivery cost',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 14,
                                color: Constants.colorOnSecondary,
                                fontFamily: Constants.cairoRegular)),
                        Text('20 SR',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 14,
                                color: Constants.colorOnSecondary,
                                fontFamily: Constants.cairoBold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: SizedBox(
                        height: 48,
                        width: size.width,
                        child: AppButton(
                            onClick: () {
                              Navigator.pushNamed(context, OrderDetailScreen.route,arguments: [true,true,true]);
                            },
                            text: AppText.CHOOSE_THE_OFFER,
                            textColor: Constants.colorOnSurface,
                            borderRadius: 8.0,
                            fontSize: 16,
                            color:  Constants.colorPrimary)),
                  )
                ],
              ),
            ),
            Container(
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
                      children:  [
                        Image.asset('assets/profile_image.png', width: 40, height: 40),

                        const SizedBox(width: 8),
                        const Text('Amir',
                            style: TextStyle(
                                fontSize: 14,
                                color: Constants.colorOnSecondary,
                                fontFamily: Constants.cairoBold)),

                        const Spacer(),
                        GestureDetector(
                          onTap: ()=>Navigator.pushNamed(context, ReviewsScreen.route),
                          child: const Text('4.5',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Constants.colorOnSecondary,
                                  fontFamily: Constants.cairoRegular)),
                        ),
                        Image.asset('assets/full.png', width: 10, height: 10),

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
                        vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Away from you',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 14,
                                color: Constants.colorOnSecondary,
                                fontFamily: Constants.cairoRegular)),
                        Text('5 km',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 14,
                                color: Constants.colorOnSecondary,
                                fontFamily: Constants.cairoBold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text('Delivery time',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 14,
                                color: Constants.colorOnSecondary,
                                fontFamily: Constants.cairoRegular)),
                        Text('1 hour',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 14,
                                color: Constants.colorOnSecondary,
                                fontFamily: Constants.cairoBold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  const [
                        Text('Delivery cost',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 14,
                                color: Constants.colorOnSecondary,
                                fontFamily: Constants.cairoRegular)),
                        Text('20 SR',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontSize: 14,
                                color: Constants.colorOnSecondary,
                                fontFamily: Constants.cairoBold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: SizedBox(
                        height: 48,
                        width: size.width,
                        child: AppButton(
                            onClick: () {
                              Navigator.pushNamed(context, OrderDetailScreen.route,arguments: [true,true,true]);
                            },
                            text: AppText.CHOOSE_THE_OFFER,
                            textColor: Constants.colorOnSurface,
                            borderRadius: 8.0,
                            fontSize: 16,
                            color:  Constants.colorPrimary)),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
