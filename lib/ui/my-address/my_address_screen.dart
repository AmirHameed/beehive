import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/choose_delivery_address_screen.dart';
import 'package:beehive/ui/common/app_button.dart';
import 'package:beehive/ui/my-address/my_address_screen_bloc.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MyAddressScreen extends StatelessWidget {
  static const String route = 'my_address_screen_route';
  const MyAddressScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final bloc=context.read<MyAddressScreenBloc>();

    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: (){
                      Navigator.pop(context, false);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                      color: Constants.colorOnSecondary,
                    )),
                Text(
                    bloc.isShippingAddress
                        ? AppText.DELIVERY_ADDRESS
                        : AppText.MY_ADDRESS,
                    style: const TextStyle(
                        color: Constants.colorOnSecondary,
                        fontSize: 16,
                        fontFamily: Constants.cairoBold)),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                        context, ChooseDeliveryAddressScreen.route);
                  },
                  child: const Text(AppText.ADD_NEW,
                      style: TextStyle(
                          color: Constants.colorOnIcon,
                          fontSize: 12,
                          fontFamily: Constants.cairoSemibold)),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            color: Constants.colorTextLight2,
            height: 1,
          ),
          const SizedBox(height: 10),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<MyAddressScreenBloc,int>(
                    builder: (_,state) =>
                      ListView.separated(
                          padding: const EdgeInsets.all(0),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          separatorBuilder: (_,__)=>const SizedBox(height: 10),
                          itemBuilder: (_,index)=>
                              GestureDetector(
                                onTap: ()=>bloc.updateIndex(index),
                                child: Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(width: 1, color:state==index?Constants.colorPrimary: Constants.colorTextLight3)),
                                  child: Column(
                                    children: [
                                      Image.asset('assets/map.png',
                                          width: size.width, height: 200, fit: BoxFit.cover),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              Text('King Faisal Street, Riyadh, Saudi Arabia',style: TextStyle( fontFamily: Constants.cairoRegular)),
                                              SizedBox(height: 10),
                                              Text('+966567112233',style: TextStyle( fontFamily: Constants.cairoRegular)),
                                            ],
                                          ),
                                          GestureDetector(
                                              onTap: ()=>Navigator.pushNamed(context, ChooseDeliveryAddressScreen.route,arguments: true),
                                              child: Image.asset('assets/edit-2.png', width: 25, height: 25)),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),

                      )),

                    bloc.isShippingAddress?   Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      child: SizedBox(
                        height: 48,
                        width: size.width,
                        child: BlocBuilder<MyAddressScreenBloc,int>(
                            builder: (_,state) => AppButton(
                                onClick: () {
                                  if (state ==-1 || !bloc.isShippingAddress) return;
                                  return Navigator.pop(context,true);
                                },
                                text: AppText.CHOOSE,
                                textColor: state!=-1? Constants.colorOnSurface:Constants.colorOnPrimary.withOpacity(0.7),
                                borderRadius: 8.0,
                                fontSize: 14,
                                fontStyle: TextStyle(
                                  fontFamily: Constants.cairoMedium,
                                  fontSize: 14,
                                  color:state!=-1? Constants.colorOnSurface:Constants.colorOnPrimary.withOpacity(0.7),
                                ),
                                color: state!=-1? Constants.colorPrimary
                                    : Constants.colorPrimaryLight)),
                      ),
                    ):const SizedBox(),

                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
