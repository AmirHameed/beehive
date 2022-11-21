import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/main/navitem/cart_nav_item_screen.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';

class ProductScreen extends StatefulWidget {
  static const String route = 'product_screen_route';

  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int count=01;
  double value=23.45;
  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;


    return Scaffold(
        bottomNavigationBar:  GestureDetector(
          onTap: ()=>Navigator.pushNamed(context, CartNavigationItemScreen.route),
          child: Container(
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
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    GestureDetector(
                        onTap: ()=>Navigator.pop(context),
                        child: const Icon(Icons.arrow_back_ios,size: 16,color: Constants.colorOnSecondary,)),
                    const Text('Hamada restaurant',
                        style: TextStyle(
                            color: Constants.colorOnSecondary,
                            fontSize: 16,
                            fontFamily: Constants.cairoBold)),
                   const SizedBox()


                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Divider(
                  thickness: 1,
                  color: Constants.colorTextLight2,
                  height: 1,
                ),
              ),


              SizedBox(
                height: 180,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 180,
                        width: size.width,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: const Image(
                              image: AssetImage(
                                  'assets/home_image1.png'),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 30,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Constants.colorError),
                        child: const Icon(
                          Icons.favorite,
                          color: Constants.colorOnPrimary,
                          size: 22,
                        ),
                      ),
                    )
                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                child: Text('Beef burger',
                    style: TextStyle(
                        fontSize: 16,
                        color: Constants.colorOnSecondary,fontFamily: Constants.cairoBold)),
              ),



              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState((){
                              count=count+1;
                              value=23.45*count;
                            });
                          },
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(60),
                            child: Container(

                              width: 28,
                              height: 28,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Container(
                                width: 26,
                                height: 26,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Constants.colorPrimary
                                ),
                                child: const Icon(Icons.add,color: Colors.white,size: 18,),
                              ),
                            ),
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(count.toString().padLeft(2,'0'),
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: Constants.colorOnSecondary,fontFamily: Constants.cairoRegular)),
                        ),
                        GestureDetector(
                          onTap: (){
                            setState((){
                              if(count>1) {
                                count=count-1;
                                value=23.45*count;
                              }
                            });
                          },
                          child: Material(
                            elevation: 8,
                            borderRadius: BorderRadius.circular(60),
                            child: Container(

                              width: 28,
                              height: 28,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: Container(
                                width: 26,
                                height: 26,
                                alignment: Alignment.center,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Constants.colorTextLight
                                ),
                                child: const Icon(Icons.remove,color: Colors.white,size: 18,),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                     Text('${value.toStringAsFixed(2)}\$',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Constants.colorOnSecondary,fontFamily: Constants.cairoBold)),

                  ],
                ),
              ),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,),
                child: Text(AppText.DETAILS,
                    style: TextStyle(
                        fontSize: 16,
                        color: Constants.colorOnSecondary,fontFamily:Constants.cairoBold)),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Text('Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsumLorem ipsumLorem ipsumLorem ipsum',
                    style: TextStyle(
                        fontSize: 12,
                        color: Constants.colorTextLight4,fontFamily: Constants.cairoMedium)),
              ),
            ],
          ),
        ));
  }
}
