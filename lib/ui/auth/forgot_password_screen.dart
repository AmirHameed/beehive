import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/auth/signup_screen.dart';
import 'package:beehive/ui/common/app_button.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/app_text_field.dart';
import 'login_screen_bloc.dart';
import 'otp_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String route = 'forgot_password_screen_route';

  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final mobileController = TextEditingController();

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
          const Text(AppText.FORGOT_PASSWORD,
              style: TextStyle(
                  color: Constants.colorOnSecondary,
                  fontSize: 26,
                  fontFamily: Constants.cairoBold)),
         const Padding(
           padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
           child: Text(AppText.PLEASE_ENTER_THE_FORGOT_PASSWORD_CODE,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Constants.colorTextLight4,
                  fontSize: 14,
                  fontFamily: Constants.cairoSemibold)),
         ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: AppTextField(
            hint: AppText.PHONE_NUMBER,
            textInputType: TextInputType.text,
            prefixIcon: Text('+966  ',style: TextStyle(color: Constants.colorTextLight, fontFamily: Constants.cairoRegular, fontSize: 14)),
            isError: false,
            isObscure: false,
          ),
        ),

          Padding(
            padding:  EdgeInsets.only(left: 20,right: 20,bottom: size.height*0.15),
            child: SizedBox(
                height: 60,
                width: size.width,
                child: AppButton(
                    onClick: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pushNamed(context, OTPScreen.route,arguments: false);
                    },
                    text: AppText.SEND,
                    textColor: Constants.colorOnSurface,
                    borderRadius: 15.0,
                    fontSize: 18,
                    color: Constants.colorPrimary)),
          ),
      ],
    ),
        ));
  }
}
