import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/auth/login_screen.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/';

  const SplashScreen();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    return Scaffold(
        body: SizedBox(
            width: size.width,
            height: size.height,
            child: Image.asset(
              'assets/BeeHive Splash.gif',
              width: size.width,
              height: size.height,
              fit: BoxFit.fill,
            )));
  }

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    Future.delayed(const Duration(seconds: 7)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(
            context, LoginScreen.route, (_) => false));
  }

  @override
  void dispose() {
    final mySystemTheme = SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Constants.colorPrimary);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
  }
}
