import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/auth/forgot_password_screen.dart';
import 'package:beehive/ui/auth/signup_screen.dart';
import 'package:beehive/ui/common/app_button.dart';
import 'package:beehive/ui/main/main_screen.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/app_text_field.dart';
import 'login_screen_bloc.dart';

class LoginScreen extends StatelessWidget {
  static const String route = 'login_screen_route';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final mobileController = TextEditingController();
    final bloc = context.read<LoginScreenBloc>();

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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: AppTextField(
              hint: AppText.PHONE_NUMBER,
              textInputType: TextInputType.text,
              prefixIcon: Text('+966  ',
                  style: TextStyle(
                      color: Constants.colorTextLight,
                      fontFamily: Constants.cairoRegular,
                      fontSize: 14)),
              isError: false,
              isObscure: false,
            ),
          ),
          BlocBuilder<LoginScreenBloc, bool>(
            builder: (_, isPasswordObscure) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AppTextField(
                  hint: AppText.PASSWORD,
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () => bloc.togglePasswordObscure(),
                      child: Icon(
                          isPasswordObscure
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          size: 22,
                          color: Constants.colorTextLight),
                    ),
                  ),
                  isObscure: isPasswordObscure,
                  textInputType: TextInputType.visiblePassword,
                  isError: false),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20, right: 20,bottom: 10),
            child: SizedBox(
                height: 60,
                width: size.width,
                child: AppButton(
                    onClick: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pushNamed(context, MainScreen.route);
                    },
                    text: AppText.LOGIN,
                    textColor: Constants.colorOnSurface,
                    borderRadius: 15.0,
                    fontSize: 18,
                    color: Constants.colorPrimary)),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding:  EdgeInsets.only(right: 20, bottom: size.height * 0.04),
              child: GestureDetector(
                onTap: () =>
                    Navigator.pushNamed(context, ForgotPasswordScreen.route),
                child: const Text(AppText.FORGOT_PASSWORD,
                    style: TextStyle(
                        color: Constants.colorPrimary,
                        fontSize: 14,
                        fontFamily: Constants.cairoRegular)),
              ),
            ),
          ),
          const Text(AppText.OR_LOGIN_VIA,
              style: TextStyle(
                  color: Constants.colorTextLight,
                  fontSize: 16,
                  fontFamily: Constants.cairoRegular)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/google_btn.png'),
              const SizedBox(width: 10),
              Image.asset('assets/apple_btn.png'),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(AppText.DONOT_HAVE_AN_ACCOUNT,
                  style: TextStyle(
                      color: Constants.colorTextLight,
                      fontSize: 14,
                      fontFamily: Constants.cairoRegular)),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, SignUpScreen.route),
                child: const Text(AppText.SIGNUP,
                    style: TextStyle(
                        color: Constants.colorPrimary,
                        fontSize: 14,
                        fontFamily: Constants.cairoBold)),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
