import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/auth/login_screen.dart';
import 'package:beehive/ui/auth/new_password_screen_bloc.dart';
import 'package:beehive/ui/auth/signup_screen.dart';
import 'package:beehive/ui/common/app_button.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../common/app_text_field.dart';
import 'login_screen_bloc.dart';
import 'new_password_screen_bloc_state.dart';
import 'otp_screen.dart';

class NewPasswordScreen extends StatelessWidget {
  static const String route = 'new_password_screen_route';

  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final mobileController = TextEditingController();
    final bloc=context.read<NewPasswordScreenBloc>();

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
                        image: AssetImage('assets/login_header.png'),
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
          const Text(AppText.CREATE_NEW_PASSWORD,
              style: TextStyle(
                  color: Constants.colorOnSecondary,
                  fontSize: 26,
                  fontFamily: Constants.cairoBold)),
         const Text(AppText.YOUR_NEW_PASSWORD_MUST_BE_DIFFIRENT,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Constants.colorTextLight4,
                fontSize: 14,
                fontFamily: Constants.cairoSemibold)),

        BlocBuilder<NewPasswordScreenBloc,NewPasswordScreenBlocState>(
          builder: (_,state)=>Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppTextField(
                hint: AppText.NEW_PASSWORD,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () =>
                        bloc.togglePasswordObscure(),
                    child: Icon( state.isNewPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                        size: 22,
                        color: Constants.colorTextLight),
                  ),
                ),
                isObscure: state.isNewPassword,
                textInputType: TextInputType.visiblePassword,
                isError: false),
          ),
        ),

        BlocBuilder<NewPasswordScreenBloc,NewPasswordScreenBlocState>(
          builder: (_,state)=>Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppTextField(
                hint: AppText.CONFIRM_NEW_PASSWORD,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () =>
                        bloc.toggleConfirmPasswordObscure(),
                    child: Icon( state.isConfirmNewPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                        size: 22,
                        color: Constants.colorTextLight),
                  ),
                ),
                isObscure: state.isConfirmNewPassword,
                textInputType: TextInputType.visiblePassword,
                isError: false),
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
                      Navigator.pushNamedAndRemoveUntil(context, LoginScreen.route,(_)=>false);
                    },
                    text: AppText.RESET,
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
