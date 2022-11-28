import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/product_screen.dart';
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
      const SizedBox(height: 10),
      const Text(AppText.FAVOURITE,
          style: TextStyle(
              color: Constants.colorOnSecondary,
              fontSize: 16,
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
            child: GestureDetector(
              onTap: ()=>Navigator.pushNamed(context, ProductScreen.route),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                          height: 90,
                          width: 90,
                          child: ClipRRect(
                              borderRadius:  BorderRadius.circular(12),
                              child: const Image(
                                image: AssetImage('assets/home_image1.png'),
                                fit: BoxFit.cover,
                              )),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Constants.colorError),
                            child: const Icon(
                              Icons.favorite,
                              color: Constants.colorOnPrimary,
                              size: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text('Delicious recipes',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Constants.colorOnSecondary,
                                  fontFamily: Constants.cairoBold)),
                          SizedBox(height: 5),
                          Text('Delicious recipes',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: Constants.cairoRegular,
                                  color: Constants.colorTextLight)),
                          SizedBox(height: 5),
                          Text('23.45 \$',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Constants.colorPrimary,fontFamily: Constants.cairoBold)),
                        ],
                      ),
                    ),
                                    ],
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}
