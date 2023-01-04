import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/auth/otp_screen.dart';
import 'package:beehive/ui/auth/signup_screen_bloc.dart';
import 'package:beehive/ui/auth/signup_screen_bloc_state.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/app_button.dart';
import '../common/app_text_field.dart';

class SignUpScreen extends StatelessWidget {
  static const String route = 'signup_screen_route';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final mobileController = TextEditingController();
    final bloc=context.read<SignupScreenBloc>();

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
      children: [
          Container(
            width: size.width,
            height: size.height / 3,
            margin: const EdgeInsetsDirectional.only(bottom: 10),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/signup_header.png'),
                    fit: BoxFit.fitWidth)),
          ),
          const Text(AppText.SIGNUP,
              style: TextStyle(
                  color: Constants.colorOnSecondary,
                  fontSize: 27,
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
        BlocBuilder<SignupScreenBloc, SignupScreenBlocState>(
          builder: (_, state) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppTextField(
                hint: AppText.PASSWORD,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () => bloc.togglePasswordObscure(),
                    child: Icon(
                        state.isPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 22,
                        color: Constants.colorTextLight),
                  ),
                ),
                isObscure: state.isPassword,
                textInputType: TextInputType.visiblePassword,
                isError: false),
          ),
        ),
        BlocBuilder<SignupScreenBloc, SignupScreenBlocState>(
          builder: (_, state) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppTextField(
                hint: AppText.CONFIRM_PASSWORD,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () => bloc.toggleConfirmPasswordObscure(),
                    child: Icon(
                        state.isConfirmPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        size: 22,
                        color: Constants.colorTextLight),
                  ),
                ),
                isObscure: state.isConfirmPassword,
                textInputType: TextInputType.visiblePassword,
                isError: false),
          ),
        ),
          Padding(
            padding:
                EdgeInsets.only(left: 20, right: 20, bottom: size.height * 0.01),
            child: SizedBox(
                height: 60,
                width: size.width,
                child: AppButton(
                    onClick: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pushNamed(context, OTPScreen.route,arguments: true);
                    },
                    text: AppText.SIGNUP,
                    textColor: Constants.colorOnSurface,
                    borderRadius: 15.0,
                    fontSize: 16,
                    color: Constants.colorPrimary)),
          ),
          const Text(AppText.OR_SIGNUP_VIA,
              style: TextStyle(color: Constants.colorTextLight, fontSize: 16,fontFamily: Constants.cairoRegular)),
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
            const Text(AppText.ALREADY_REGISTERED,
                style:
                TextStyle(color: Constants.colorTextLight, fontSize: 14,fontFamily: Constants.cairoRegular)),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Text(AppText.LOGIN,
                  style: TextStyle(
                      color: Constants.colorPrimary,
                      fontSize: 14,
                      fontFamily: Constants.cairoBold)),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    ),
        ));
  }
}
