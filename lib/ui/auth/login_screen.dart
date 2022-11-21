import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/auth/signup_screen.dart';
import 'package:beehive/ui/common/app_button.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'otp_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String route = 'login_screen_route';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final mobileController = TextEditingController();

    final mySystemTheme = SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Constants.colorPrimary);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
      children: [
          Container(
            width: size.width,
            height: size.height / 3,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/login_header.png'),
                    fit: BoxFit.fitWidth)),
          ),
          const Text(AppText.LOGIN,
              style: TextStyle(
                  color: Constants.colorOnSecondary,
                  fontSize: 26,
                  fontFamily: Constants.cairoBold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              const Text(AppText.NEW_USER,
                  style:
                      TextStyle(color: Constants.colorTextLight, fontSize: 16,fontFamily: Constants.cairoRegular)),
              GestureDetector(
                onTap: ()=>Navigator.pushNamed(context, SignUpScreen.route),
                child: const Text(AppText.SIGNUP,
                    style:
                        TextStyle(color: Constants.colorPrimary, fontSize: 16,fontFamily: Constants.cairoBold)),
              ),
            ],
          ),
          Container(
              height: 60,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.only(bottom: 20, top: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Constants.colorTextLight)),
              child: Row(children: [
                const Text(
                  '+966 ',
                  style:
                      TextStyle(color: Constants.colorOnSecondary, fontSize: 14,fontFamily: Constants.cairoRegular),
                ),
                Expanded(
                    child: TextFormField(
                        controller: mobileController,
                        onChanged: (String? value) {},
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                            color: Constants.colorOnSecondary, fontSize: 14),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: AppText.MOBILE_NUMBER,
                            hintStyle: TextStyle(
                                color: Constants.colorTextLight, fontSize: 13,fontFamily: Constants.cairoRegular))))
              ])),
          Padding(
            padding:  EdgeInsets.only(left: 20,right: 20,bottom: size.height*0.15),
            child: SizedBox(
                height: 60,
                width: size.width,
                child: AppButton(
                    onClick: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pushNamed(context, OTPScreen.route);
                    },
                    text: AppText.LOGIN,
                    textColor: Constants.colorOnSurface,
                    borderRadius: 15.0,
                    fontSize: 18,
                    color: Constants.colorPrimary)),
          ),

          const Text(AppText.OR_LOGIN_VIA,
              style:
              TextStyle(color: Constants.colorTextLight, fontSize: 16,fontFamily: Constants.cairoRegular)),

          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/google_btn.png'),
              const SizedBox(width: 10),
              Image.asset('assets/apple_btn.png'),



            ],
          )
      ],
    ),
        ));
  }
}
