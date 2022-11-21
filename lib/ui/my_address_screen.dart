import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/choose_delivery_address_screen.dart';
import 'package:beehive/ui/common/app_button.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyAddressScreen extends StatelessWidget {
  static const String route = 'my_address_screen_route';

  final isShippingAddress;

  const MyAddressScreen({Key? key, this.isShippingAddress = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          Navigator.pop(context, true);
          return false;
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
                        size: 16,
                        color: Constants.colorOnSecondary,
                      )),
                  Text(
                      isShippingAddress
                          ? AppText.DELIVERY_ADDRESS
                          : AppText.MY_ADDRESS,
                      style: const TextStyle(
                          color: Constants.colorOnSecondary,
                          fontSize: 16,
                          fontFamily: Constants.cairoBold)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, ChooseDeliveryAddressScreen.route);
                    },
                    child: const Text(AppText.ADD_NEW,
                        style: TextStyle(
                            color: Constants.colorOnIcon,
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
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border:
                      Border.all(width: 1, color: Constants.colorTextLight3)),
              child: Column(
                children: [
                  Image.asset('assets/map.png',
                      width: size.width, height: 200, fit: BoxFit.cover),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text('King Faisal Street, Riyadh, Saudi Arabia',style: TextStyle( fontFamily: Constants.cairoRegular)),
                          SizedBox(height: 10),
                          Text('+966567112233',style: TextStyle( fontFamily: Constants.cairoRegular)),
                        ],
                      ),
                      GestureDetector(
                          onTap: ()=>Navigator.pushNamed(context, ChooseDeliveryAddressScreen.route,arguments: true),
                          child: Image.asset('assets/edit-2.png', width: 25, height: 25)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(width: 1, color: Constants.colorPrimary)),
              child: Column(
                children: [
                  Image.asset('assets/map.png',
                      width: size.width, height: 200, fit: BoxFit.cover),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text('King Faisal Street, Riyadh, Saudi Arabia',style: TextStyle( fontFamily: Constants.cairoRegular)),
                          SizedBox(height: 10),
                          Text('+966567112233',style: TextStyle( fontFamily: Constants.cairoRegular)),
                        ],
                      ),
                      GestureDetector(
                          onTap: ()=>Navigator.pushNamed(context, ChooseDeliveryAddressScreen.route,arguments: true),
                          child: Image.asset('assets/edit-2.png', width: 25, height: 25)),
                    ],
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class _SingleProfileItemNavigation extends StatelessWidget {
  final String title;
  final String name;
  final VoidCallback onTap;

  const _SingleProfileItemNavigation(
      {required this.title, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: Constants.colorTextLight2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Constants.colorOnSecondary,
                      fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              Text(name,
                  style: const TextStyle(
                      fontSize: 14, color: Constants.colorTextLight)),
            ],
          ),
          GestureDetector(
            onTap: onTap,
            child: const Text('Change',
                style: TextStyle(
                    fontSize: 14,
                    color: Constants.colorPrimary,
                    fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}

showChangeInformationBottomSheet(
    BuildContext context, String title, String header, String text) {
  final _formkey = GlobalKey<FormState>();
  final size = context.screenSize;

  return showModalBottomSheet(
    context: context,
    enableDrag: true,
    isDismissible: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
    ),
    builder: (context) {
      return Column(
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
          const SizedBox(
            height: 10,
          ),
          Text(header,
              style: const TextStyle(
                  fontSize: 16,
                  color: Constants.colorOnSecondary,
                  fontWeight: FontWeight.w600)),
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 14, color: Constants.colorOnSecondary)),
                  Container(
                      height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(
                          bottom: 20, top: 10, left: 0, right: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Constants.colorTextLight)),
                      child: TextFormField(
                          controller: TextEditingController(),
                          onChanged: (String? value) {},
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              color: Constants.colorOnSecondary, fontSize: 14),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: text,
                              hintStyle: const TextStyle(
                                  color: Constants.colorTextLight,
                                  fontSize: 13)))),
                  SizedBox(
                      height: 48,
                      width: size.width,
                      child: AppButton(
                          onClick: () {
                            FocusScope.of(context).unfocus();
                          },
                          text: AppText.SAVE,
                          textColor: Constants.colorOnSurface,
                          borderRadius: 8.0,
                          fontSize: 16,
                          color: Constants.colorPrimary)),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}

showChangePasswordInformationBottomSheet(BuildContext context) {
  final _formkey = GlobalKey<FormState>();
  final size = context.screenSize;

  return showModalBottomSheet(
    context: context,
    enableDrag: true,
    isDismissible: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
    ),
    builder: (context) {
      return Column(
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
          const SizedBox(
            height: 10,
          ),
          const Text(AppText.CHANGE_PASSWORD,
              style: TextStyle(
                  fontSize: 16,
                  color: Constants.colorOnSecondary,
                  fontWeight: FontWeight.w600)),
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(AppText.CURRENT_PASSWORD,
                      style: TextStyle(
                          fontSize: 14, color: Constants.colorOnSecondary)),
                  Container(
                      height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(
                          bottom: 20, top: 10, left: 0, right: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Constants.colorTextLight)),
                      child: TextFormField(
                          controller: TextEditingController(),
                          onChanged: (String? value) {},
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              color: Constants.colorOnSecondary, fontSize: 14),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.remove_red_eye_rounded,
                                  color: Constants.colorTextLight, size: 22),
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter',
                              hintStyle: TextStyle(
                                  color: Constants.colorTextLight,
                                  fontSize: 13)))),
                  const Text(AppText.NEW_PASSWORD,
                      style: TextStyle(
                          fontSize: 14, color: Constants.colorOnSecondary)),
                  Container(
                      height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(
                          bottom: 20, top: 10, left: 0, right: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Constants.colorTextLight)),
                      child: TextFormField(
                          controller: TextEditingController(),
                          onChanged: (String? value) {},
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              color: Constants.colorOnSecondary, fontSize: 14),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.remove_red_eye_rounded,
                                  color: Constants.colorTextLight, size: 22),
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter',
                              hintStyle: TextStyle(
                                  color: Constants.colorTextLight,
                                  fontSize: 13)))),
                  const Text(AppText.CONFIRM_NEW_PASSWORD,
                      style: TextStyle(
                          fontSize: 14, color: Constants.colorOnSecondary)),
                  Container(
                      height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(
                          bottom: 20, top: 10, left: 0, right: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Constants.colorTextLight)),
                      child: TextFormField(
                          controller: TextEditingController(),
                          onChanged: (String? value) {},
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              color: Constants.colorOnSecondary, fontSize: 14),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: Icon(Icons.remove_red_eye_rounded,
                                  color: Constants.colorTextLight, size: 22),
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter',
                              hintStyle: TextStyle(
                                  color: Constants.colorTextLight,
                                  fontSize: 13)))),
                  SizedBox(
                      height: 48,
                      width: size.width,
                      child: AppButton(
                          onClick: () {
                            FocusScope.of(context).unfocus();
                          },
                          text: AppText.SAVE,
                          textColor: Constants.colorOnSurface,
                          borderRadius: 8.0,
                          fontSize: 16,
                          color: Constants.colorPrimary)),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}
