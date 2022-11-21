import 'dart:async';

import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/common/app_button.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChooseDeliveryAddressScreen extends StatefulWidget {
  static const String route = 'choose_delivery_address_screen_route';

  final bool isEdit;
  const ChooseDeliveryAddressScreen({this.isEdit = false});

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  State<ChooseDeliveryAddressScreen> createState() =>
      _ChooseDeliveryAddressScreenState();
}

class _ChooseDeliveryAddressScreenState
    extends State<ChooseDeliveryAddressScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: size.width,
              height: size.height,
              child: GoogleMap(
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                mapType: MapType.normal,
                initialCameraPosition: ChooseDeliveryAddressScreen._kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 230,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
                child: Column(
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
                    const Text(AppText.PHONE_NUMBER,
                        style: TextStyle(
                            fontSize: 16,
                            color: Constants.colorOnSecondary,
                            fontFamily: Constants.cairoSemibold)),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(AppText.PHONE_NUMBER,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: Constants.cairoRegular,
                                  color: Constants.colorOnSecondary)),
                          Container(
                              height: 48,
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              margin: const EdgeInsets.only(
                                  bottom: 20, top: 10, left: 0, right: 0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      color: Constants.colorTextLight)),
                              child: TextFormField(
                                  controller: TextEditingController(),
                                  onChanged: (String? value) {},
                                  keyboardType: TextInputType.text,
                                  style: const TextStyle(
                                      color: Constants.colorOnSecondary,
                                      fontSize: 14),
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      hintText: AppText.ENTER,
                                      hintStyle: TextStyle(
                                          fontFamily: Constants.cairoRegular,
                                          color: Constants.colorTextLight,
                                          fontSize: 13)))),
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
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text(widget.isEdit?AppText.EDIT_DELIVERY_ADDRESS: AppText.CHOOSE_DELIVERY_ADDRESS,
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: Constants.cairoBold,
                            color: Constants.colorOnSecondary)),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.clear,
                            size: 22, color: Constants.colorOnSecondary))
                  ],
                ),
              ),
            ),
            const Positioned(
                top: 50,
                right: 0,
                child: Image(
                    image: AssetImage('assets/map_on_icon1st.png'),
                    width: 60,
                    height: 60)),
            Align(
                alignment: Alignment.center,
                child: Image.asset('assets/map_pin_icon.png',
                    width: 60, height: 60, fit: BoxFit.cover)),
            Align(
                alignment: Alignment.centerRight,
                child: Image.asset('assets/map_current_location.png',
                    width: 60, height: 60)),
          ],
        ),
      ),
    );
  }
}
