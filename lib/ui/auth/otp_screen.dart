import 'dart:async';

import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/auth/signup_profile_screen.dart';
import 'package:beehive/ui/common/app_button.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  static const String route = 'otp_screen_route';

  const OTPScreen({Key? key}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final mobileController = TextEditingController();
  int timerMaxSeconds = 59;
  int currentSeconds = 0;
  Duration internal = const Duration(seconds: 1);

  startTimeout() {
    var duration = internal;
    Timer.periodic(duration, (timer) {
      setState(() {
        if (timer.tick == 59) {
          timer.cancel();
        }
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) timer.cancel();
      });
    });
  }

  String get text =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';


  @override
  void initState() {
    startTimeout();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: size.width,
                height: size.height / 3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/otp_header.png'),
                        fit: BoxFit.fitWidth)),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Padding(
                        padding: EdgeInsets.only(top: 60, left: 20),
                        child: Icon(Icons.arrow_back_ios_new_outlined,
                            color: Constants.colorOnSecondary, size: 22)),
                  ))
            ],
          ),
          const Text(AppText.OTP,
              style: TextStyle(
                  color: Constants.colorOnSecondary,
                  fontSize: 27,
                  fontFamily: Constants.cairoBold)),
          const Text(AppText.PLEASE_ENTER_THE_OTP_CODE,
              style: TextStyle(
                  color: Constants.colorTextLight,
                  fontSize: 16,
                  fontFamily: Constants.cairoRegular)),
          Container(
              height: 60,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.only(
                  bottom: 10, top: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Constants.colorTextLight)),
              child: TextFormField(
                  controller: mobileController,
                  onChanged: (String? value) {},
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(
                      color: Constants.colorOnSecondary, fontSize: 14),
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: AppText.ENTER_CODE,
                      hintStyle: TextStyle(
                          color: Constants.colorTextLight,
                          fontSize: 13,
                          fontFamily: Constants.cairoRegular)))),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: SizedBox(
                height: 60,
                width: size.width,
                child: AppButton(
                    onClick: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pushNamed(context, SignUpProfileScreen.route);
                    },
                    text: AppText.CONFIRM,
                    textColor: Constants.colorOnSurface,
                    borderRadius: 15.0,
                    fontSize: 16,
                    color: Constants.colorPrimary)),
          ),
          Text(text,
              style: const TextStyle(
                  color: Constants.colorOnSecondary,
                  fontSize: 18,
                  fontFamily: Constants.cairoBold)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(AppText.NOT_RECEIVED,
                  style: TextStyle(
                      color: Constants.colorTextLight,
                      fontSize: 16,
                      fontFamily: Constants.cairoRegular)),
              SizedBox(width: 5),
              Text(AppText.RESEND,
                  style: TextStyle(
                      color: Constants.colorPrimary,
                      fontSize: 16,
                      fontFamily: Constants.cairoBold)),
            ],
          ),
        ],
      ),
    ));
  }
}
