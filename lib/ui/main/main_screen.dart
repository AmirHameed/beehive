import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/main/main_screen_bloc.dart';
import 'package:beehive/ui/main/main_screen_state.dart';
import 'package:beehive/ui/main/navitem/cart_nav_item_screen.dart';
import 'package:beehive/ui/main/navitem/favourite_nav_item_screen.dart';
import 'package:beehive/ui/main/navitem/home_nav_item_screen.dart';
import 'package:beehive/ui/main/navitem/notification_nav_item_screen.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gif/flutter_gif.dart';

class MainScreen extends StatefulWidget {
  static const String route = 'main_screen_route';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin{
  static const _homeNavigationKey = PageStorageKey(HomeNavigationItemScreen.key_title);
  static const _cardNavigationKey = PageStorageKey(CartNavigationItemScreen.key_title);
  static const _notificationNavigationKey = PageStorageKey(NotificationNavigationItemScreen.key_title);
  static const _favouriteNavigationKey = PageStorageKey(FavouriteNavigationItemScreen.key_title);
  final _bottomMap = <PageStorageKey<String>, Widget>{};
  late FlutterGifController controller1,
      controller2,
      controller4,
      controller5;

  @override
  void initState() {
    controller1 = FlutterGifController(vsync: this);
    controller2 = FlutterGifController(vsync: this);
    controller5 = FlutterGifController(vsync: this);
    controller4 = FlutterGifController(vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller1.repeat(
        min: 0,
        max: 65,
        period: const Duration(milliseconds: 1000),
      );
      Future.delayed(const Duration(seconds: 2))
          .then((value) => controller1.stop());
    });
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   controller2.repeat(
    //     min: 0,
    //     max: 33,
    //     period: const Duration(milliseconds: 500),
    //   );
    //   Future.delayed(const Duration(seconds: 1))
    //       .then((value) => controller2.animateTo(33));
    // });
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   controller4.repeat(
    //     min: 0,
    //     max: 40,
    //     period: const Duration(milliseconds: 1000),
    //   );
    //   Future.delayed(const Duration(seconds: 2)).then((value) => controller4.stop());
    // });
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   controller5.repeat(
    //     min: 0,
    //     max: 54,
    //     period: const Duration(milliseconds: 1000),
    //   );
    //   Future.delayed(const Duration(seconds: 2)).then((value) => controller5.stop());
    // });
    _bottomMap[_homeNavigationKey] =  const HomeNavigationItemScreen(key: _homeNavigationKey);
    _bottomMap[_cardNavigationKey] = const CartNavigationItemScreen(key: _cardNavigationKey);
    _bottomMap[_notificationNavigationKey] = const SizedBox();
    _bottomMap[_favouriteNavigationKey] = const SizedBox();

    final mySystemTheme = SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Constants.colorOnSurface);
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final _bottomNavItems = <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: const Image(
            image: AssetImage('assets/home.png'), width: 25, height: 25),
        label: '',
        activeIcon: GifImage(
            controller: controller1,
            image: const AssetImage('assets/home_selected.gif'),
            width: 25,
            height: 25),
      ),
      BottomNavigationBarItem(
        label: '',
        icon: const Image(
            image: AssetImage('assets/card.png'),
            width: 25,
            height: 25),
        activeIcon: GifImage(
            controller: controller2,
            image: const AssetImage('assets/card_selected.gif'),
            width: 25,
            height: 25),
      ),
      BottomNavigationBarItem(
          icon: const Image(
              image: AssetImage('assets/notification.png'),
              width: 25,
              height: 25),
          label: '',
          activeIcon: GifImage(
              controller: controller4,
              image: const AssetImage('assets/notification_selected.gif'),
              width: 25,
              height: 25)),
      BottomNavigationBarItem(
          label: '',
          icon: const Image(
              image: AssetImage('assets/favourite.png'),
              width: 25,
              height: 25),
          activeIcon: GifImage(
              controller: controller5,
              image: const AssetImage('assets/favourite_selected.gif'),
              width: 25,
              height: 25)),
    ];

    final size = context.screenSize;
    final bloc = context.read<MainScreenBloc>();

    final mySystemTheme = SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Constants.colorOnPrimary);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
    return Scaffold(
        bottomNavigationBar: BlocBuilder<MainScreenBloc, MainScreenState>(
            buildWhen: (previous, current) => previous.index != current.index,
            builder: (_, state) {
              return ClipRRect(
                borderRadius: const BorderRadius.only(topRight: Radius.circular(24), topLeft: Radius.circular(24)),
                child: BottomNavigationBar(
                  key: bloc.globalKey,
                  onTap: (int newIndex) {
                    if (state.index == newIndex) return;
                    final pageStorageKey = _bottomMap.keys.elementAt(newIndex);
                    final bottomItem = _bottomMap[pageStorageKey];
                    if (bottomItem == null || bottomItem is SizedBox) {
                      final newBottomWidget = _getNavigationWidget(newIndex);
                      _bottomMap[pageStorageKey] = newBottomWidget;
                    }
                    if (newIndex == 0) {
                      controller1.repeat(
                        min: 0,
                        max: 65,
                        period: const Duration(milliseconds: 900),
                      );
                      Future.delayed(const Duration(milliseconds: 900)).then((value) {
                        controller1.stop();
                        controller1.animateTo(65,duration: const Duration(milliseconds: 0));});
                    }
                    if (newIndex == 1) {
                      controller2.repeat(
                        min: 0,
                        max: 33,
                        period: const Duration(milliseconds: 700),
                      );
                      Future.delayed(const Duration(milliseconds: 700))
                          .then((value) {
                            controller2.stop();
                            controller2.animateTo(33,duration: const Duration(milliseconds: 0));});
                    }
                    if (newIndex == 2) {
                      controller4.repeat(
                        min: 0,
                        max: 40,
                        period: const Duration(milliseconds: 800),
                      );
                      Future.delayed(const Duration(milliseconds: 800))
                          .then((value) {
                            controller4.stop();
                            controller4.animateTo(40,duration: Duration(milliseconds: 0));});
                    }
                    if (newIndex == 3) {
                      controller5.repeat(
                        min: 0,
                        max: 54,
                        period: const Duration(milliseconds: 870),
                      );
                      Future.delayed(const Duration(milliseconds: 870))
                          .then((value) {
                            controller5.stop();
                            controller5.animateTo(54,duration: const Duration(milliseconds: 0));});
                    }

                    bloc.updateIndex(newIndex);
                  },
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  items: _bottomNavItems,
                  currentIndex: state.index,
                  elevation: 12,
                  backgroundColor: Constants.colorPrimary,
                  type: BottomNavigationBarType.fixed,
                ),
              );
            }),
        body: SafeArea(
            child: WillPopScope(
                onWillPop: () async => false,
                child: SizedBox(
                  width: size.width,
                  height: size.height - kBottomNavigationBarHeight,
                  child: BlocBuilder<MainScreenBloc, MainScreenState>(
                      buildWhen: (previous, current) =>
                      previous.index != current.index,
                      builder: (_, state) => IndexedStack(
                          index: state.index,
                          children: _bottomMap.values.toList())),
                ))),);
  }

  Widget _getNavigationWidget(int index) {
    switch (index) {
      case 0:
        return const HomeNavigationItemScreen(key: _homeNavigationKey);
      case 1:
        return const CartNavigationItemScreen(key: _cardNavigationKey);
      case 2:
        return const NotificationNavigationItemScreen(key: _notificationNavigationKey);
      case 3:
        return const FavouriteNavigationItemScreen(key: _favouriteNavigationKey);
      default:
        return const SizedBox();
    }
  }
}
