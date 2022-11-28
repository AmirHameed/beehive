import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/helper/dialog_helper.dart';
import 'package:beehive/ui/choose_delivery_address_screen.dart';
import 'package:beehive/ui/common/app_button.dart';
import 'package:beehive/ui/order_tracking_screen.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ChatScreen extends StatelessWidget {
  static const String route = 'chat_screen_route';
  const ChatScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final dialogHelper = DialogHelper.instance();

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
          child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context, true),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 16,
                        color: Constants.colorOnSecondary,
                      )),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Row(
                        children:  [
                          Image.asset('assets/profile_image.png', width: 40, height: 40),

                          const SizedBox(width: 8),
                          const Text('Amir',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Constants.colorOnSecondary,
                                  fontFamily: Constants.cairoBold)),
                          const SizedBox(width: 4),

                          const Text('4.5',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Constants.colorOnSecondary,
                                  fontFamily: Constants.cairoRegular)),
                          const SizedBox(width: 3),
                          Image.asset('assets/full.png', width: 15, height: 15),
                          const Spacer(),


                        PopupMenuButton<int>(
                          color: Constants.colorOnSurface,
                          tooltip: '',
                          offset: const Offset(0,30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 10,
                          icon: const Icon(
                            Icons.more_horiz,
                          ),
                          itemBuilder: (context) => [
                            const PopupMenuItem<int>(
                                value: 0,
                                child: Text(
                                  'Cancel order',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: Constants.cairoMedium,
                                      color: Constants.colorOnSecondary),
                                )),
                            const PopupMenuItem<int>(
                                value: 0,
                                child: Text(
                                  'Report',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: Constants.cairoMedium,
                                      color: Constants.colorOnSecondary),
                                )),
                          ],
                          onSelected: (index) {
                            if(index==0){
                              dialogHelper
                                ..injectContext(context)
                                ..showDeleteDialog();
                            }
                          },
                        )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: Constants.colorTextLight3,
              height: 1,
            ),
            Material(
              elevation: 2,
              shadowColor: Constants.colorTextLight2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                            height: 48,
                            width: size.width,
                            child: IconAppButton(
                                onClick: () {
                                  Navigator.pushNamed(context, OrderTrackingScreen.route);
                                },
                                prefixIcon: Image.asset('assets/location_tracking.png',width: 22,height: 22),
                                text: AppText.ORDER_TRACKING,
                                textColor: Constants.colorOnPrimary,
                                borderRadius: 8.0,
                                fontSize: 14,
                                color:  Constants.colorPrimary)),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                            height: 48,
                            width: size.width,
                            child: IconAppButton(
                                onClick: () {
                                },
                                prefixIcon: Image.asset('assets/call_tracking.png',width: 22,height: 22),
                                text: AppText.CONTACT_PROVIDER,
                                textColor: Constants.colorPrimary,
                                borderRadius: 8.0,
                                fontSize: 14,
                                color:  Constants.colorLightPink2)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              child: Column(
                children: [
                  const Text('Tuesday, April 10',style: TextStyle(fontSize: 14, fontFamily: Constants.cairoRegular,color: Constants.colorOnSecondary)),


                  const SizedBox(height: 10),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/profile_image.png', width: 30, height: 30),

                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        padding: const EdgeInsets.only(left: 8),
                        decoration: BoxDecoration(
                          color: Constants.colorChat,
                          borderRadius: BorderRadius.circular(12)

                        ),
                        height: 60,
                        width: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('Hello',style: TextStyle(fontSize: 14, fontFamily: Constants.cairoRegular,color: Constants.colorOnPrimary)),
                            SizedBox(height: 5),
                            Text('11:03 am',style: TextStyle(fontSize: 10, fontFamily: Constants.cairoRegular,color: Constants.colorChatText))
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        padding: const EdgeInsets.only(right: 8,left: 8),
                        decoration: BoxDecoration(
                            color: Constants.colorTextLight3,
                            borderRadius: BorderRadius.circular(12)

                        ),
                        height: 80,
                        width: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Text('Welcome, Im going to the site right now',style: TextStyle(fontSize: 14,height: 1.5, fontFamily: Constants.cairoRegular,color: Constants.colorOnSecondary)),
                            SizedBox(height: 5),
                            Text('11:03 am',style: TextStyle(fontSize: 10, fontFamily: Constants.cairoRegular,color: Constants.colorChatText))
                          ],
                        ),
                      ),
                      Image.asset('assets/profile_image.png', width: 30, height: 30),
                    ],
                  ),
                ],
              ),
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  color: Constants.colorOnPrimary,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                  child: Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Image(image: AssetImage('assets/camera.png'),width: 25,height: 25),
                        visualDensity: VisualDensity.compact,
                        splashRadius: 1,
                        padding: const EdgeInsets.all(0)),

                    Expanded(
                        child: TextField(
                            controller:TextEditingController(),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            style: const TextStyle(color: Constants.colorOnPrimary, fontSize: 14),
                            decoration:  InputDecoration(
                                contentPadding: const EdgeInsets.only(bottom: 9, left: 10, right: 10),
                                hintText: 'your message',
                                hintStyle: const TextStyle(color: Constants.colorTextLight, fontSize: 14, fontFamily: Constants.cairoRegular),
                                border: InputBorder.none,
                                suffixIconConstraints: const BoxConstraints(maxHeight: 50,maxWidth: 50),
                                suffixIcon:const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Image(image: AssetImage('assets/send_icon.png'),width: 30,height: 30,fit: BoxFit.cover,),
                                ) ,
                                focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Constants.colorTextLight,width: 1),borderRadius: BorderRadius.circular(12)),
                                enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Constants.colorTextLight,width: 1),borderRadius: BorderRadius.circular(12)),
                                disabledBorder: InputBorder.none))),
                  ])),
            )



          ]),
        ),
      ),
    );
  }
}
