import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';

class FavouriteNavigationItemScreen extends StatelessWidget {
  static const String key_title = 'favourite_nav_screen_key_title';

  const FavouriteNavigationItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      const SizedBox(height: 20),
      const Text(AppText.FAVOURITE,
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
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          scrollDirection: Axis.vertical,
          itemBuilder: (_, index) => Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Constants.colorOnSurface,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 100,
                        width: 110,
                        child: ClipRRect(
                            borderRadius:  BorderRadius.circular(12),
                            child: RotatedBox(
                              quarterTurns: 2,
                              child: Image(
                                image: AssetImage('assets/home_image1.png'),
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Constants.colorError),
                          child: Icon(
                            Icons.favorite,
                            color: Constants.colorOnPrimary,
                            size: 22,
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text('Delicious recipes',
                            style: TextStyle(
                                fontSize: 16,
                                color: Constants.colorOnSecondary,
                                fontFamily: Constants.cairoBold)),
                        SizedBox(height: 15),
                        Text('Delicious recipes',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: Constants.cairoRegular,
                                color: Constants.colorTextLight)),
                        SizedBox(height: 15),
                        Text('23.45 \$',
                            style: TextStyle(
                                fontSize: 14,
                                color: Constants.colorPrimary,fontFamily: Constants.cairoBold)),
                      ],
                    ),
                  ),
                                  ],
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
