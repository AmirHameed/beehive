import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';

class NotificationNavigationItemScreen extends StatelessWidget {
  static const String key_title = 'notification_nav_screen_key_title';

  const NotificationNavigationItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SizedBox(height: 20),
      const Text(AppText.NOTIFICATION,
          style: TextStyle(
              color: Constants.colorOnSecondary,
              fontSize: 22,
              fontFamily: Constants.cairoBold)),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Divider(
          thickness: 1,
          color: Constants.colorTextLight2,
          height: 1,
        ),
      ),
      Expanded(
        child: ListView.separated(
          itemCount: 6,
          physics: const BouncingScrollPhysics(),
          separatorBuilder: (_, __) => const Divider(thickness: 1,height: 1,color: Constants.colorTextLight2),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) => Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Constants.colorOnSurface,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                 Container(
                  height: 40,
                  width: 40,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.colorPrimary.withAlpha(50)
                  ),
                  child: const Image(
                    image: AssetImage( 'assets/notification_icon.png')
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 0, left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: const [
                        Text('Lerom ipsumLerom Lerom ipsumLerom Lerom ipsumLerom',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: Constants.cairoRegular,
                                color: Constants.colorOnSecondary)),
                        SizedBox(height: 10),
                        Text('10 min',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: Constants.cairoRegular,
                                color: Constants.colorTextLight)),
                      ],
                    ),
                  ),
                ),
                                ],
            ),
          ),
        ),
      )
    ]);
  }
}
