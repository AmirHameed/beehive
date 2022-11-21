import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/profile_screen.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../category-detail/category_detail_screen.dart';

class HomeNavigationItemScreen extends StatelessWidget {
  static const String key_title = 'Home_navigation_detail_screen_key_title';

  const HomeNavigationItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Row(children: [
          GestureDetector(
            onTap:()=>Navigator.pushNamed(context, ProfileScreen.route),
            child: Image.asset(
              'assets/profile.png',
              width: 30,
              height: 30,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 0),
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Constants.colorTextLight2),
              child: TextFormField(
                  controller: TextEditingController(),
                  onChanged: (String? value) {},
                  keyboardType: TextInputType.text,
                  style: const TextStyle(
                      color: Constants.colorOnSecondary, fontSize: 14),
                  decoration:  InputDecoration(
                      border: InputBorder.none,
                      prefixIcon:Image.asset('assets/search_home.png',width: 20,height: 20),
                      focusedBorder: InputBorder.none,
                      prefixIconConstraints: const BoxConstraints(maxHeight: 30,minWidth: 30),
                      contentPadding: const EdgeInsetsDirectional.only(top: 3),
                      hintText: AppText.SEARCH,
                      hintStyle: const TextStyle(
                          color: Constants.colorOnBorder, fontSize: 13,fontFamily: Constants.cairoRegular))),
            ),
          ),
        ]),
      ),
      const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Divider(
          thickness: 1,
          color: Constants.colorTextLight2,
          height: 1,
        ),
      ),
      Expanded(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                    child: Stack(
                  children: [
                    Image.asset('assets/home_location_header_big.png'),
                    const Positioned(
                        right: 10,
                        top: 25,
                        child: Icon(Icons.keyboard_arrow_down,
                            size: 25, color: Constants.colorOnPrimary)),
                    Positioned(
                      left: 10,
                      top: 15,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text('Location',
                              style: TextStyle(
                                  color: Constants.colorOnPrimary, fontSize: 12,fontFamily: Constants.cairoRegular)),
                          Text('Reyadh ',
                              style: TextStyle(
                                  color: Constants.colorOnPrimary,
                                  fontSize: 15,
                                  fontFamily: Constants.cairoBold))
                        ],
                      ),
                    )
                  ],
                )),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 150,
                  width: size.width,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 150,
                        width: size.width,
                        child:  Container(
                          color: Constants.colorOnPrimary,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: const Image(
                                image: AssetImage('assets/home_order.png'),
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                      Container(
                        height: 150,
                        width: size.width,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            colors: [
                              Color(0x1a000000),
                              Color(0x80000000),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),

                      Positioned(
                        top: 25,
                        left: 10,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text('Beef burgur',
                                style: TextStyle(
                                    color: Constants.colorOnPrimary,
                                    fontSize: 16,
                                    fontFamily: Constants.cairoBold)),
                            const Text('Discount 25 %',
                                style: TextStyle(
                                    color: Constants.colorOnPrimary, fontSize: 13,fontFamily: Constants.cairoRegular)),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: Constants.colorOnPrimary,
                              ),
                              alignment: Alignment.center,
                              height: 35,
                              width: 90,
                              child: const Text(
                                'Order now',
                                style: TextStyle(color: Constants.colorPrimary,fontFamily: Constants.cairoRegular),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Text('Categories',
                      style: TextStyle(
                          color: Constants.colorOnSecondary,
                          fontFamily: Constants.cairoBold,
                          fontSize: 18)),
                ),
              ),
              GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5
                ),
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                shrinkWrap: true,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: ()=>Navigator.pushNamed(context, CategoriesDetailScreen.route),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ClipRRect(
                            borderRadius:  BorderRadius.circular(12),
                            child: Image(
                              image: AssetImage(index == 0
                                  ? 'assets/home_image1.png'
                                  : index == 1
                                  ? 'assets/home_image2.png'
                                  : index == 2
                                  ? 'assets/home_image3.png'
                                  : index == 3
                                  ? 'assets/home_image1.png'
                                  : 'assets/home_image2.png'),fit: BoxFit.cover,)),
                      ),
                      const SizedBox(height: 10),
                       Text(index==0?'Spices and nuts':index==1?'kitchen':index==2?'juices':'Sewing',
                          style: const TextStyle(
                              fontSize: 14,
                              color: Constants.colorOnSecondary,fontFamily: Constants.cairoBold)),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
