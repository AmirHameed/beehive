import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/product_screen.dart';
import 'package:beehive/ui/reviews_screen.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class RestaurantDetailScreen extends StatefulWidget {
  static const String route = 'restaurant_detail_screen_route';

  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  State<RestaurantDetailScreen> createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  late ScrollController _scrollController;

   Color _textColor=Constants.colorOnPrimary;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _textColor = _isSliverAppBarExpanded ? Constants.colorOnSecondary : Constants.colorOnPrimary;
        });
      });
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (170 - kToolbarHeight);
  }


  @override
  Widget build(BuildContext context) {
    List<String> listOfItem = ['Beef burgur', 'Pizza', 'Chicken', 'Steak'];
    final size = context.screenSize;
    return Scaffold(
        bottomNavigationBar:  Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          decoration: BoxDecoration(
              color: Constants.colorPrimary,
              borderRadius: BorderRadius.circular(4)
          ),
          child: Row(
            children:  [
              const Text(AppText.CART,
                  style: TextStyle(
                      color: Constants.colorOnPrimary,
                      fontFamily: Constants.cairoRegular,
                      fontSize: 14)),
              const SizedBox(width: 10),
              Container(
                  height: 30,
                  width: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Constants.colorPrimary,
                      border: Border.all(width: 1,color: Constants.colorOnPrimary)
                  ),child: const Text('1',style: TextStyle(color: Constants.colorOnPrimary,fontFamily: Constants.cairoRegular))),
              const Spacer(),

              const Text('All',
                  style: TextStyle(
                      color: Constants.colorOnPrimary,
                      fontFamily: Constants.cairoRegular,
                      fontSize: 14)),
              const SizedBox(width: 10),
              const Text('34.00 \$',
                  style: TextStyle(
                      color: Constants.colorOnPrimary,
                      fontSize: 14,
                      fontFamily: Constants.cairoBold)),

            ],
          ),
        ),
        body: CustomScrollView(
          controller: _scrollController,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          snap: true,
          floating: true,
          expandedHeight: 170.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child:  Icon(Icons.arrow_back_ios_new_outlined,
                  color: _textColor, size: 22)),
          flexibleSpace:  FlexibleSpaceBar(
               centerTitle: true,
              title: Text('Hamada Restaurant',style: TextStyle(color:_textColor,fontFamily: Constants.cairoBold,fontSize: 16),textAlign: TextAlign.center),
              background: const Image(
                  image: AssetImage('assets/home_image2.png'),
                  fit: BoxFit.cover)),
        ),
        SliverToBoxAdapter(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Hamada Restaurant',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: Constants.cairoBold,
                      color: Constants.colorOnSecondary)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children:  [
                  Image.asset('assets/location_tracking.png',color: Constants.colorOnIcon,width: 20,height: 20),

                  const Text('Saudi Arabia,Riyadh (3 miles away)',
                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: Constants.cairoMedium,
                          color: Constants.colorOnIcon)),
                ],
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: ()=>Navigator.pushNamed(context, ReviewsScreen.route,arguments: true),
                child: Row(
                  children: const [
                    Icon(Icons.star, size: 20, color: Colors.amber),
                    Text(' 4.5 ',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            fontFamily: Constants.cairoRegular,
                            color: Constants.colorOnSecondary)),
                    Text('(456 Reviews)',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: Constants.cairoRegular,
                            color: Constants.colorOnIcon)),
                  ],
                ),
              ),
            ],
          ),
        )),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 50,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.only(top: 4, bottom: 4),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: 10),
                          itemCount: listOfItem.length,
                          itemBuilder: (_, index) => Column(
                                children: [
                                  Text(listOfItem[index],
                                      style: TextStyle(
                                          color: listOfItem[index] == 'Beef burgur'
                                                  ? Constants.colorOnSecondary
                                                  : Constants.colorTextLight4,
                                      fontFamily: Constants.cairoRegular
                                      )),
                                  const SizedBox(height: 5),
                                  listOfItem[index] == 'Beef burgur'
                                      ? const SizedBox(
                                          width: 70,
                                          child: Divider(
                                              thickness: 2,
                                              height: 2,
                                              color: Constants.colorPrimary),
                                        )
                                      : const SizedBox()
                                ],
                              )),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text('Beef burgur',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: Constants.cairoBold,
                            color: Constants.colorOnSecondary)),
                  ),
                  ListView.separated(
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    separatorBuilder: (_, index) => const SizedBox(height: 8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    itemBuilder: (_, index) => GestureDetector(
                      onTap: () => Navigator.pushNamed(context, ProductScreen.route),
                      child: Material(
                        elevation: 2,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
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
                                    width: 100,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: const Image(
                                          image: AssetImage(
                                              'assets/home_image1.png'),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration:  BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:index.isOdd?Constants.colorTextLight:Constants.colorError),
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
                                padding:
                                    const EdgeInsets.only(top: 0, left: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: const [
                                    Text('Beef burgur',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: Constants.cairoBold,
                                            color: Constants.colorOnSecondary,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(height: 10),
                                    Text('Lorem ipsum Lorem ipsum',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: Constants.cairoSemibold,
                                            color: Constants.colorTextLight)),
                                    SizedBox(height: 10),
                                    Text('23.45 \$',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: Constants.cairoBold,
                                            color: Constants.colorPrimary)),
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
          }, childCount: 1),
        ),
      ],
    ));
  }
}
