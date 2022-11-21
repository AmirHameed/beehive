import 'package:beehive/ui/resturant_detail_screen.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';

import '../reviews_screen.dart';

class CategoriesDetailScreen extends StatelessWidget {
  static const String route = 'category_detail_screen_route';

  const CategoriesDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 5,
              shadowColor: Colors.pinkAccent.shade100,
              child: Container(
                color: Constants.colorRestaurantDetail,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Expanded(child: Image(image: AssetImage('assets/restaurant_detail_image.png'),fit: BoxFit.cover,height: 150,)),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        padding:const EdgeInsets.only(top: 20,bottom: 20),
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children:  [
                            GestureDetector(
                                onTap: ()=>Navigator.pop(context),
                                child:const Icon(Icons.arrow_forward_ios_rounded, color: Constants.colorOnSecondary, size: 18)),
                            Column(
                              children: const [
                                Text('Biryani',
                                    style: TextStyle(
                                        fontSize: 22,
                                        height: 0.5,
                                        fontFamily: Constants.cairoBold,
                                        color: Constants.colorOnSecondary)),
                                Text('9 Restaurant',
                                    style: TextStyle(
                                        fontSize: 12,fontWeight: FontWeight.w400,
                                        fontFamily: Constants.cairoRegular,
                                        color: Constants.colorOnSecondary)),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: ListView.separated(
                itemCount: 6,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (_,__)=>const SizedBox(height: 10),
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                scrollDirection: Axis.vertical,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, RestaurantDetailScreen.route);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Image(
                          image: AssetImage('assets/restuarant_menu1.png'),fit: BoxFit.cover,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Hamada Restaurant',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: Constants.cairoBold,
                                      color: Constants.colorOnSecondary)),
                              GestureDetector(
                                onTap: ()=>Navigator.pushNamed(context, ReviewsScreen.route,arguments: true),
                                child: Row(
                                  children: const [
                                    Text('4.5 ',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: Constants.cairoRegular,
                                            color: Constants.colorOnSecondary)),
                                    Icon(Icons.star, size: 18, color: Colors.amber),
                                    Text(' (456+)',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: Constants.cairoRegular,
                                            color: Constants.colorTextLight)),
                                  ],
                                ),
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children:  [
                              Image.asset('assets/location_tracking.png',color: Constants.colorOnIcon,width: 20,height: 20),
                              const Text('Saudia Arabia,Riyadh (3 miles away)',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: Constants.cairoMedium,
                                      color: Constants.colorOnIcon)),
                            ],
                          ),
                          const SizedBox(height: 5),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
