import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/my-address/my_address_screen.dart';
import 'package:beehive/ui/my_information_screen.dart';
import 'package:beehive/ui/order/order_screen.dart';
import 'package:beehive/ui/payment-method/payment_method_screen.dart';
import 'package:beehive/ui/setting/setting_screen.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';

import 'common/app_bar.dart';
import 'common/app_button.dart';

class ProfileScreen extends StatelessWidget {
  static const String route = 'profile_screen_route';

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
         const AppBarItem(title: AppText.PROFILE),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
                child: Stack(
              children: [
                Image.asset('assets/home_location_header.png'),
                Positioned(
                  left: 10,
                  top: 15,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text('Your Balance',
                          style: TextStyle(
                              color: Constants.colorOnPrimary, fontSize: 12, fontFamily: Constants.cairoRegular)),
                      Text('234.34\$',
                          style: TextStyle(
                              color: Constants.colorOnPrimary,
                              fontSize: 15,
                              fontFamily: Constants.cairoBold))
                    ],
                  ),
                )
              ],
            )),
          ),
          const SizedBox(height: 10),
          _SingleProfileItemNavigation(
              title: AppText.MY_INFORMATION,
              image: 'assets/user-square.png',
              onTap: () =>
                  Navigator.pushNamed(context, MyInformationScreen.route)),
          _SingleProfileItemNavigation(
              title: AppText.MY_ORDERS, image: 'assets/note@2x.png', onTap: () {
            Navigator.pushNamed(context, OrderScreen.route);
          }),
          _SingleProfileItemNavigation(
              title: AppText.MY_ADDRESS,
              image: 'assets/location@2x.png',
              onTap: () {
                Navigator.pushNamed(context, MyAddressScreen.route,arguments: false);
              }),
          _SingleProfileItemNavigation(
              title: AppText.PAYMENT_METHODS,
              image: 'assets/card-pos@2x.png',
              onTap: () {
                Navigator.pushNamed(context, PaymentMethodScreen.route,arguments: false);
              }),
          _SingleProfileItemNavigation(
              title: AppText.SETTINGS, image: 'assets/setting-2@2x.png', onTap: () {
                Navigator.pushNamed(context, SettingScreen.route);
          }),

          _SingleProfileItemNavigation(
              title: AppText.TERM_AND_CONDITION,
              image: 'assets/term_and_condition.png',
              onTap: () {}),
          _SingleProfileItemNavigation(
              title: AppText.PRIVACY_POLICY,
              image: 'assets/privacy.png',
              onTap: () {}),
          _SingleProfileItemNavigation(
              title: AppText.SUPPORT,
              image: 'assets/call_profile_icon.png',
              onTap: () =>showContactInformationBottomSheet(context)),


        ]),
      ),
    );
  }
}

class _SingleProfileItemNavigation extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;

  const _SingleProfileItemNavigation(
      {required this.title, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        onTap: onTap,
        title: Text(title,
            style: const TextStyle(
                color: Constants.colorOnSecondary, fontSize: 16, fontFamily: Constants.cairoRegular)),
        leading: Image.asset(image, height: 30, width: 30),
        trailing: const Icon(Icons.arrow_forward_ios_rounded,
            size: 20, color: Constants.colorTextLight),
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Constants.colorTextLight2, width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
showContactInformationBottomSheet(BuildContext context) {
  final size = context.screenSize;
  return showModalBottomSheet(
    context: context,
    enableDrag: true,
    isDismissible: true,
    isScrollControlled: true,
    constraints: BoxConstraints(minHeight: size.height/1.4,maxHeight: size.height/1.4),
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Constants.colorTextLight2,
              ),
              width: 40,
              height: 6,
            ),
            const Text(AppText.SUPPORT,
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: Constants.cairoSemibold,
                    color: Constants.colorOnSecondary)),
            const SizedBox(height: 20),
            const Image(image: AssetImage('assets/contact_image.png'),width: 188,height: 188,),

            const SizedBox(height: 20),

            const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: Constants.cairoRegular,
                    color: Constants.colorOnSecondary)),
            const SizedBox(
                height: 20),

            SizedBox(
              height: 48,
              width: size.width,
              child: RawMaterialButton(
                  constraints: const BoxConstraints(minHeight: 44, maxHeight: 44),
                  fillColor:Constants.colorPrimary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  onPressed: () {},
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/contact_message.png',width: 22,height: 22),
                        const SizedBox(width:  5),
                        const Padding(
                          padding: EdgeInsets.only(right: 22),
                          child: Text(AppText.CONTACT_VIA_EMAIL,
                              style: TextStyle(
                                  color: Constants.colorOnPrimary,
                                  fontFamily: Constants.cairoMedium,
                                  fontSize: 14)),
                        )
                      ])),
            ),
            const SizedBox(height: 10),
            SizedBox(
                height: 48,
                width: size.width,
                child: IconAppButton(
                    onClick: () {},
                    prefixIcon: Image.asset('assets/contact_watsapp.png',width: 30,height: 22),
                    text: AppText.CONTACT_VIA_WHATSAPP,
                    textColor: Constants.colorOnPrimary,
                    borderRadius: 8.0,
                    fontSize: 14,
                    color:  Constants.colorPrimary))
          ],
        ),
      );
    },
  );
}
