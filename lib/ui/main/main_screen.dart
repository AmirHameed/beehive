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
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  static const String route = 'main_screen_route';

  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const _homeNavigationKey = PageStorageKey(HomeNavigationItemScreen.key_title);
  static const _cardNavigationKey = PageStorageKey(CartNavigationItemScreen.key_title);
  static const _notificationNavigationKey = PageStorageKey(NotificationNavigationItemScreen.key_title);
  static const _favouriteNavigationKey = PageStorageKey(FavouriteNavigationItemScreen.key_title);
  final _bottomMap = <PageStorageKey<String>, Widget>{};


  @override
  void initState() {
    _bottomMap[_homeNavigationKey] =  const HomeNavigationItemScreen(key: _homeNavigationKey);
    _bottomMap[_cardNavigationKey] = const SizedBox();
    _bottomMap[_notificationNavigationKey] = const SizedBox();
    _bottomMap[_favouriteNavigationKey] = const SizedBox();

    final mySystemTheme = SystemUiOverlayStyle.light.copyWith(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        statusBarColor: Constants.colorOnSurface);
    SystemChrome.setSystemUIOverlayStyle(mySystemTheme);
    super.initState();
  }

  final _bottomNavItems = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
        icon: Image(
            image: AssetImage('assets/home.png'),
            width: 25,
            height: 25),
        label: '',
        activeIcon: Image(
            image: AssetImage('assets/home_selected.png'),
            width: 25,
            height: 25)),
    const BottomNavigationBarItem(
        label: '',
        icon: Image(image: AssetImage('assets/card.png'), width: 25, height: 25),
        activeIcon: Image(
            image: AssetImage('assets/card_selected.png'),
            width: 25,
            height: 25)),
    const BottomNavigationBarItem(
        icon: Image(
            image: AssetImage('assets/notification.png'),
            width: 25,
            height: 25),
        label: '',
        activeIcon: Image(
          image: AssetImage('assets/notification_selected.png'),
          width: 25,
          height: 25,
        )),
    const BottomNavigationBarItem(
        label: '',
        icon: Image(image: AssetImage('assets/favourite.png'), width: 25, height: 25),
        activeIcon: Image(
            image: AssetImage('assets/favourite_selected.png'),
            width: 25,
            height: 25)),
  ];

  @override
  Widget build(BuildContext context) {
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
