import 'dart:io';
import 'package:beehive/translation/codegen_loader.g.dart';
import 'package:beehive/ui/auth/login_screen.dart';
import 'package:beehive/ui/auth/otp_screen.dart';
import 'package:beehive/ui/auth/signup_profile_screen.dart';
import 'package:beehive/ui/auth/signup_profile_screen_bloc.dart';
import 'package:beehive/ui/auth/signup_screen.dart';
import 'package:beehive/ui/category-detail/category_detail_screen.dart';
import 'package:beehive/ui/category-detail/category_detail_screen_bloc.dart';
import 'package:beehive/ui/choose_delivery_address_screen.dart';
import 'package:beehive/ui/main/navitem/cart_nav_item_screen.dart';
import 'package:beehive/ui/my-address/my_address_screen.dart';
import 'package:beehive/ui/my-address/my_address_screen_bloc.dart';
import 'package:beehive/ui/my_information_screen.dart';
import 'package:beehive/ui/order-detail/order_detail_screen_bloc.dart';
import 'package:beehive/ui/order/order_screen.dart';
import 'package:beehive/ui/order/order_screen_bloc.dart';
import 'package:beehive/ui/order-detail/order_detail_screen.dart';
import 'package:beehive/ui/order_tracking_screen.dart';
import 'package:beehive/ui/order_tracking_screen_bloc.dart';
import 'package:beehive/ui/payment-method/payment_method_screen.dart';
import 'package:beehive/ui/payment-method/payment_method_screen_bloc.dart';
import 'package:beehive/ui/product_screen.dart';
import 'package:beehive/ui/profile_screen.dart';
import 'package:beehive/ui/provider_offers_screen.dart';
import 'package:beehive/ui/resturant_detail_screen.dart';
import 'package:beehive/ui/chat_screen.dart';
import 'package:beehive/ui/reviews_screen.dart';
import 'package:beehive/ui/setting/setting_screen.dart';
import 'package:beehive/ui/setting/setting_screen_bloc.dart';
import 'package:beehive/ui/splash_screen.dart';
import 'package:beehive/ui/main/main_screen.dart';
import 'package:beehive/ui/main/main_screen_bloc.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final deviceLocale = Platform.localeName;
  final countryCode = deviceLocale.split('_')[0];
  runApp(EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      assetLoader: const CodegenLoader(),
      startLocale: Locale(countryCode),
      fallbackLocale: Locale(countryCode),
      child: const _App()));
}

final _mySystemTheme = SystemUiOverlayStyle.light.copyWith(
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
    statusBarColor: Constants.colorOnSurface);

const _colorScheme = ColorScheme(
    primary: Constants.colorPrimary,
    primaryContainer: Constants.colorPrimaryVariant,
    secondary: Constants.colorSecondaryVariant,
    secondaryContainer: Constants.colorSecondaryVariant,
    surface: Constants.colorSurface,
    background: Constants.colorBackground,
    error: Constants.colorError,
    onPrimary: Constants.colorOnPrimary,
    onSecondary: Constants.colorOnSecondary,
    onSurface: Constants.colorOnSurface,
    onBackground: Constants.colorOnBackground,
    onError: Constants.colorOnError,
    brightness: Brightness.light);

ThemeData _buildAppThemeData() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
      colorScheme: _colorScheme,
      primaryColor: Constants.colorPrimary,
      unselectedWidgetColor: Constants.colorOnIcon,
      scaffoldBackgroundColor: Constants.colorOnSurface,
      errorColor: Constants.colorError);
}

class _AppRouter {
  Route _getPageRoute(Widget screen) => Platform.isIOS
      ? CupertinoPageRoute(builder: (_) => screen)
      : MaterialPageRoute(builder: (_) => screen);

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreen.route:
        return _getPageRoute(const SplashScreen());
      case LoginScreen.route:
        return _getPageRoute(const LoginScreen());
      case SignUpScreen.route:
        return _getPageRoute(const SignUpScreen());
      case OTPScreen.route:
        return _getPageRoute(const OTPScreen());
      case SignUpProfileScreen.route:
        return _getPageRoute(BlocProvider(
            create: (_) => SignUpProfileScreenBloc(),
            child: const SignUpProfileScreen()));
      case MainScreen.route:
        return _getPageRoute(BlocProvider(
            create: (_) => MainScreenBloc(), child: const MainScreen()));
      case ProfileScreen.route:
        return _getPageRoute(const ProfileScreen());
      case MyInformationScreen.route:
        return _getPageRoute(const MyInformationScreen());
      case SettingScreen.route:
        return _getPageRoute(BlocProvider(
            create: (_) => SettingScreenBloc(), child: const SettingScreen()));
      case MyAddressScreen.route:
        final argument = settings.arguments as bool;
        return _getPageRoute(BlocProvider(
            create: (_) => MyAddressScreenBloc(isShippingAddress: argument), child: const MyAddressScreen()));
      case ChooseDeliveryAddressScreen.route:
        final argument = settings.arguments as bool?;
        return _getPageRoute(ChooseDeliveryAddressScreen(isEdit: argument??false));
      case PaymentMethodScreen.route:
        final argument = settings.arguments as bool;
        return _getPageRoute(BlocProvider(
            create: (_) => PaymentMethodScreenBloc(isShippingAddress: argument), child: const PaymentMethodScreen()));
      case OrderScreen.route:
        return _getPageRoute(BlocProvider(
            create: (_) => OrderScreenBloc(), child: const OrderScreen()));
      case OrderDetailScreen.route:
        final argument = settings.arguments as List;
        final bool isDetail=argument[0];
        final bool isProviderDetail=argument[1];
        final bool isDeliveryPayment=argument[2];
        return _getPageRoute(BlocProvider(
            create: (_) => OrderDetailScreenBloc(isOrderDetail: isDetail,isProviderOffer: isProviderDetail,isDeliveryPayment: isDeliveryPayment),
            child: const OrderDetailScreen()));
      case RestaurantDetailScreen.route:
        return _getPageRoute(const RestaurantDetailScreen());
      case CategoriesDetailScreen.route:
        return _getPageRoute(BlocProvider(
            create: (_) => CategoryDetailScreenBloc(),
            child: const CategoriesDetailScreen()));
      case ProductScreen.route:
        return _getPageRoute(const ProductScreen());
      case CartNavigationItemScreen.route:
        return _getPageRoute(const CartNavigationItemScreen(isBottom: true));
      case ProviderOfferScreen.route:
        return _getPageRoute(const ProviderOfferScreen());
      case ChatScreen.route:
        return _getPageRoute(const ChatScreen());
      case OrderTrackingScreen.route:
        return _getPageRoute(BlocProvider(
            create: (_) => OrderTrackingScreenBloc(),
            child: const OrderTrackingScreen()));
      case ReviewsScreen.route:
        final argument = settings.arguments as bool?;
        return _getPageRoute(ReviewsScreen(isRestaurant: argument??false));
    }
    return null;
  }

  void dispose() {}
}

class _App extends StatefulWidget {
  const _App();

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<_App> with WidgetsBindingObserver {
  final _AppRouter __appRouter = _AppRouter();

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(_mySystemTheme);
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeLocales(List<Locale>? locales) {
    _setLanguage();
    super.didChangeLocales(locales);
  }

  void _setLanguage() async {
    final deviceLocale = Platform.localeName;
    final countryLanguage = deviceLocale.split('_')[0];
    if (countryLanguage == 'de') {
      await context.setLocale(const Locale('de'));
    } else {
      await context.setLocale(const Locale('en'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppText.APP_NAME,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: __appRouter.onGenerateRoute,
        theme: _buildAppThemeData());
  }

  @override
  void dispose() {
    __appRouter.dispose();
    super.dispose();
  }
}
