import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/common/app_button.dart';
import 'package:beehive/ui/order_tracking_screen.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import '../helper/dialog_helper.dart';

class ChatScreen extends StatelessWidget {
  static const String route = 'chat_screen_route';
  const ChatScreen({Key? key})
      : super(key: key);



  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final dialogHelper = DialogHelper.instance();
    final chatController=TextEditingController();
    final formState=GlobalKey<FormState>();

    return Scaffold(
      bottomNavigationBar:Container(
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
                child: TextFormField(
                    controller:chatController,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    onChanged: (value){
                      // chatController.text=value;
                    },
                    onSaved: (String? value){
                      chatController.text=value as String;
                    },
                    style: const TextStyle(color: Constants.colorOnSecondary, fontSize: 14),
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
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
          child: SizedBox(
            width: size.width,
            height: size.height,
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
                                    value: 1,
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
                                if(index==1){
                                  showReportBottomSheet(context);
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

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
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
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

showReportBottomSheet(BuildContext context) {
  final _formkey = GlobalKey<FormState>();
  final size = context.screenSize;
  TextEditingController reasonController=TextEditingController();

  return showModalBottomSheet(
    context: context,
    enableDrag: true,
    isDismissible: true,
    isScrollControlled: true,
    constraints: BoxConstraints(minHeight: size.height/1.9,maxHeight: size.height/1.9),
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8.0), topRight: Radius.circular(8.0)),
    ),
    builder: (context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Constants.colorTextLight2,
            ),
            width: 40,
            height: 6,
          ),
          const Text(AppText.REPORT,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: Constants.cairoSemibold,
                  color: Constants.colorOnSecondary)),
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(AppText.SELECT_REASON,
                      style: TextStyle(
                          fontSize: 14, color: Constants.colorOnSecondary, fontFamily: Constants.cairoRegular)),

                  PopupMenuButton(
                      elevation: 20,
                      constraints: BoxConstraints(maxWidth: size.width - 20),
                      enabled: true,
                      position: PopupMenuPosition.over,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10))),
                      offset: const Offset(0, 30),
                      tooltip: '',
                      splashRadius: 0,
                      onSelected: (value) {
                        context.unfocus();
                       reasonController.text = value.toString();
                      },
                      itemBuilder: (context) {
                        context.unfocus();
                        return ['Report A','Report B','Report C']
                            .map((String choice) => PopupMenuItem(
                            textStyle: const TextStyle(color: Constants.colorSurface),
                            value: choice,
                            child: SizedBox(
                                width: size.width,
                                child: Text(choice))))
                            .toList();
                      },
                      child: Container(
                          height: 48,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          margin: const EdgeInsets.only(
                              bottom: 20, top: 10, left: 0, right: 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(color: Constants.colorTextLight)),
                          child: TextFormField(
                              enabled: false,
                              readOnly: true,
                              textInputAction: TextInputAction.next,
                              onTap: () => context.unfocus(),
                              controller: reasonController,
                              style: const TextStyle(
                                  color: Constants.colorOnSecondary,
                                  fontFamily: Constants.cairoRegular,
                                  fontSize: 14),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: AppText.SELECT_REASON,
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5),
                                    child: Icon(Icons.keyboard_arrow_down_rounded,
                                        size: 22, color: Constants.colorTextLight),
                                  ),
                                  focusedBorder: InputBorder.none,
                                  hintStyle: TextStyle(
                                      color: Constants.colorSecondary,
                                      fontFamily: Constants.cairoRegular,
                                      fontSize: 13))))),

                  const Text(AppText.DETAILS,
                      style: TextStyle(
                          fontSize: 14, color: Constants.colorOnSecondary, fontFamily: Constants.cairoRegular)),
                  Container(
                      height: 110,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(bottom: 20, top: 10, left: 0, right: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Constants.colorTextLight)),
                      child: TextFormField(
                          controller: TextEditingController(),
                          maxLines: 5,
                          onChanged: (String? value) {},
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              color: Constants.colorOnSecondary, fontSize: 14),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: AppText.EXPLAIN_YOUR_PROBLEM_HERE,
                              hintStyle: TextStyle(
                                  color: Constants.colorTextLight,
                                  fontFamily: Constants.cairoRegular,
                                  fontSize: 13)))),
                  SizedBox(
                      height: 48,
                      width: size.width,
                      child: AppButton(
                          onClick: () {
                            FocusScope.of(context).unfocus();
                          },
                          text: AppText.Submit,
                          textColor: Constants.colorOnSurface,
                          borderRadius: 8.0,
                          fontSize: 16,
                          color: Constants.colorPrimary)),
                ],
              ),
            ),
          ),
        ],
      );
    },
  );
}

