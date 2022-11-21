import 'dart:io';

import 'package:beehive/data/meta_data.dart';
import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/auth/signup_profile_screen_bloc.dart';
import 'package:beehive/ui/common/app_button.dart';
import 'package:beehive/ui/common/app_text_field.dart';
import 'package:beehive/ui/main/main_screen.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:morphable_shape/morphable_shape.dart';

class SignUpProfileScreen extends StatelessWidget {
  static const String route = 'signup_profile_screen_route';

  const SignUpProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final bloc = context.read<SignUpProfileScreenBloc>();
    final mobileController = TextEditingController();

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
      children: [
          Stack(children: [
            Container(
              width: size.width,
              height: size.height / 3,
              margin: const EdgeInsetsDirectional.only(bottom: 10),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/header_bg.png'),
                      fit: BoxFit.fitWidth)),
            ),
            Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: ()=>Navigator.pop(context),
                  child: const Padding(
                      padding: EdgeInsets.only(top: 60,left: 20),
                      child: Icon(Icons.arrow_back_ios_new_outlined,color: Constants.colorOnSecondary,size: 22)),
                )),
            BlocBuilder<SignUpProfileScreenBloc, DataEvent>(
                buildWhen: (previous, current) => previous != current,
                builder: (_, dataEvent) {
                  return Positioned(
                    bottom: 50,
                    left: 0,
                    right: 0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        children: [
                          if (dataEvent is Data)
                            SizedBox(
                                height: 90,
                                width: 90,
                                child: Material(
                                  color: Constants.colorOnSurface,
                                  shape: PolygonShapeBorder(
                                      sides: 6,
                                      cornerRadius: 10.toPercentLength,
                                      cornerStyle: CornerStyle.rounded),
                                  clipBehavior: Clip.antiAlias,
                                  child: Center(
                                    child: SizedBox(
                                        height: 85,
                                        width: 85,
                                        child: Material(
                                          color: Constants.colorOnIcon,
                                          shape: PolygonShapeBorder(
                                              sides: 6,
                                              cornerRadius: 10.toPercentLength,
                                              cornerStyle: CornerStyle.rounded),
                                          clipBehavior: Clip.antiAlias,
                                          child: Image.file(
                                              File(dataEvent.data.path)),
                                        )),
                                  ),
                                ))
                          else
                            SizedBox(
                              height: 90,
                              width: 90,
                              child: Image.asset('assets/signup_ic.png'),
                            ),
                          Positioned(
                            left: 55,
                            top: 40,
                            child: Align(
                                alignment: Alignment.center,
                                child: GestureDetector(
                                    onTap: () async {
                                      final selectedImage = await ImagePicker()
                                          .pickImage(source: ImageSource.gallery);
                                      if (selectedImage == null) return;
                                      bloc.handleImageSelection(selectedImage);
                                    },
                                    child: Image.asset('assets/add_icon.png',
                                        width: 40, height: 40))),
                          )
                        ],
                      ),
                    ),
                  );
                })
          ]),
          Container(
              height: 60,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              margin:
                  const EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Constants.colorTextLight)),
              child: Row(children: [
                const Text(
                  '+966 ',
                  style:
                      TextStyle(color: Constants.colorOnSecondary, fontSize: 14),
                ),
                Expanded(
                    child: TextFormField(
                        controller: mobileController,
                        onChanged: (String? value) {},
                        keyboardType: TextInputType.phone,
                        style: const TextStyle(
                            color: Constants.colorOnSecondary, fontSize: 14),
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            hintText: AppText.MOBILE_NUMBER,
                            hintStyle: TextStyle(
                                color: Constants.colorTextLight, fontSize: 13,fontFamily: Constants.cairoRegular))))
              ])),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: AppTextField(
                hint: AppText.FULL_NAME,
                textInputType: TextInputType.text,
                isError: false),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: AppTextField(
                hint: AppText.CURRENT_LOCATION,
                textInputType: TextInputType.text,
                isError: false,
                suffixIcon: Icon(Icons.location_on,
                    color: Constants.colorPrimary, size: 22)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: SizedBox(
                height: 60,
                width: size.width,
                child: AppButton(
                    onClick: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pushNamed(context, MainScreen.route);
                    },
                    text: AppText.SAVE,
                    textColor: Constants.colorOnSurface,
                    borderRadius: 15.0,
                    fontSize: 16,
                    color: Constants.colorPrimary)),
          ),
      ],
    ),
        ));
  }
}
