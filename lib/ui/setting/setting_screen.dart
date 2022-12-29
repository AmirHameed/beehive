import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/common/app_bar.dart';
import 'package:beehive/ui/common/app_button.dart';
import 'package:beehive/ui/setting/setting_screen_bloc.dart';
import 'package:beehive/ui/setting/setting_screen_bloc_state.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SettingScreen extends StatelessWidget {
  static const String route = 'setting_screen_route';

  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final bloc=context.read<SettingScreenBloc>();

    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const AppBarItem(title: AppText.SETTINGS),
          _SingleProfileItemNavigation(
            title: AppText.LANGUAGE,
            name: AppText.ENGLISH,
            onTap: () {
              showChangeInformationBottomSheet(context);
            },
          ),
          const SizedBox(height: 20),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(width: 1, color: Constants.colorTextLight2)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(AppText.NOTIFICATIONS,
                    style: TextStyle(
                        fontSize: 16,
                        color: Constants.colorOnSecondary,
                        fontFamily: Constants.cairoSemibold)),
                BlocBuilder<SettingScreenBloc,SettingScreenBlocState>(
                  builder: (_,state)=>
                      Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                    value: state.isNotification,

                    onChanged: (value) =>
                        bloc.changeValue(value),
                    activeColor: Constants.colorGreen,

                  ),
                      ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

class _SingleProfileItemNavigation extends StatelessWidget {
  final String title;
  final String name;
  final VoidCallback onTap;

  const _SingleProfileItemNavigation(
      {required this.title, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: Constants.colorTextLight2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 16,
                      color: Constants.colorOnSecondary,
                      fontFamily: Constants.cairoSemibold)),
              const SizedBox(height: 10),
              Text(name,
                  style: const TextStyle(
                      fontSize: 14, color: Constants.colorTextLight,fontFamily: Constants.cairoRegular)),
            ],
          ),
          GestureDetector(
            onTap: onTap,
            child: const Text('Change',
                style: TextStyle(
                    fontSize: 14,
                    color: Constants.colorPrimary,
                    fontWeight: FontWeight.w400)),
          ),
        ],
      ),
    );
  }
}

showChangeInformationBottomSheet(
    BuildContext context) {
  final _formkey = GlobalKey<FormState>();
  final size = context.screenSize;
  bool isEnglish=true;

  return showModalBottomSheet(
    context: context,
    enableDrag: true,
    isScrollControlled: true,
    constraints: BoxConstraints(minHeight: size.height/3.2,maxHeight: size.height/3.2),
    isDismissible: true,
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
          const SizedBox(
            height: 10,
          ),
          const Text(AppText.CHANGE_LANGUAGE,
              style: TextStyle(
                  fontSize: 16,
                  color: Constants.colorOnSecondary,
                  fontFamily: Constants.cairoSemibold)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                StatefulBuilder(
                  builder: (_,setState)=>
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                            isEnglish=true;
                            setState((){});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                width: 1,
                                color:isEnglish==true?Colors.transparent: Constants.colorTextLight2
                              ),
                              color:isEnglish==true? Constants.colorPrimary.withOpacity(0.05):Colors.transparent
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset('assets/english_flag.png',height: 30,width: 30),
                                const SizedBox(width: 5),
                                 Text(AppText.ENGLISH,style: TextStyle(fontSize: 14,fontFamily: Constants.cairoLight,color:isEnglish==true? Constants.colorPrimary:Constants.colorOnSecondary),)
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child:GestureDetector(
                          onTap: (){
                            isEnglish=false;
                            setState((){});
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 60,
                            width:size.width/4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    width: 1,
                                    color:isEnglish==false?Colors.transparent: Constants.colorTextLight2
                                ),
                                color:isEnglish==false? Constants.colorPrimary.withOpacity(0.05):Colors.transparent
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Image.asset('assets/arabic_flag.png',height: 30,width: 30),
                                const SizedBox(width: 5),

                                Text(AppText.ARABIC,style: TextStyle(fontSize: 14,fontFamily: Constants.cairoLight,color:isEnglish==false? Constants.colorPrimary:Constants.colorOnSecondary),)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                    height: 48,
                    width: size.width,
                    child: AppButton(
                        onClick: () {
                          FocusScope.of(context).unfocus();
                        },
                        text: AppText.SAVE,
                        textColor: Constants.colorOnSurface,
                        borderRadius: 8.0,
                        fontSize: 16,
                        color: Constants.colorPrimary)),
              ],
            ),
          ),
        ],
      );
    },
  );
}