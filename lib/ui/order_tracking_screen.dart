import 'dart:async';

import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/order_tracking_screen_bloc.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'common/app_button.dart';

class OrderTrackingScreen extends StatefulWidget {
  static const String route = 'order_tracking_screen_route';

  const OrderTrackingScreen({Key? key}) : super(key: key);
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final bloc = context.read<OrderTrackingScreenBloc>();
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
                initialCameraPosition: OrderTrackingScreen._kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 120, right: 50),
                  child: Image.asset('assets/on_tracking_imag.png',
                      width: 250, height: 250),
                )),
            Positioned(
              top: 30,
              left: 0,
              right: 0,
              child: Container(
                  width: size.width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12)),
                  child: BlocBuilder<OrderTrackingScreenBloc, bool>(
                    builder: (_, state) => Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Stepper(
                            isStepperActive: true,
                            text: AppText.THE_DRIVER_IS_HEADING_TO_THE_PICKUP_LOCATION),
                        GestureDetector(
                            onTap: () => bloc.updateTracking(),
                            child: Stepper(
                                text: AppText
                                    .THE_DRIVER_REACED_AT_THE_TOP_PICKUP_LOCATION,
                                isStepperActive: state ? true : false)),
                        Stepper(
                            text: AppText
                                .THE_DRIVER_HAS_PICKED_YOUR_ORDER_AND_ON_HIS_WAY_TO_YOU,
                            isStepperActive: state ? true : false),
                        Stepper(
                            text: AppText
                                .THE_DRIVER_HAS_ARRIVED_AT_THE_DELIVERY_POINT,
                            isDotted: false,
                            isStepperActive: state ? true : false)
                      ],
                    ),
                  )),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Image.asset('assets/map_current_location.png',
                          width: 60, height: 60)),
                  Container(
                    width: size.width,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(AppText.THE_PROVIDER_HAS_ARRIVED,
                            style: TextStyle(
                                fontSize: 14,
                                color: Constants.colorOnSecondary,
                                fontFamily: Constants.cairoSemibold)),
                        const SizedBox(height: 10),
                        BlocBuilder<OrderTrackingScreenBloc, bool>(
                          builder: (_, state) => SizedBox(
                              height: 48,
                              width: size.width,
                              child: AppButton(
                                  onClick: () {
                                    // FocusScope.of(context).unfocus();
                                  },
                                  text: AppText.RECEIPT_OF_THE_ORDER_AND_RELEASE_MONEY,
                                  textColor:state? Constants.colorOnSurface:Constants.colorOnPrimary.withOpacity(0.7),
                                  borderRadius: 8.0,
                                  fontSize: 14,
                                  fontStyle: TextStyle(
                                    fontFamily: Constants.cairoMedium,
                                    fontSize: 14,
                                    color:state? Constants.colorOnSurface:Constants.colorOnPrimary.withOpacity(0.7),
                                  ),
                                  color: state
                                      ? Constants.colorPrimary
                                      : Constants.colorPrimaryLight),
                        ))
                      ],
                    ),
                  ),
                ],
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
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios,
                            size: 22, color: Constants.colorOnSecondary)),
                    const Text(AppText.ORDER_TRACKING,
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: Constants.cairoBold,
                            color: Constants.colorOnSecondary)),
                    const SizedBox()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Stepper extends StatelessWidget {
  final bool isStepperActive;
  final bool isDotted;
  final String text;

  const Stepper(
      {this.isStepperActive = false, this.isDotted = true, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(120),
              shadowColor: Colors.grey,
              child: Container(
                width: 25,
                height: 25,
                padding: const EdgeInsets.all(0.0),
                decoration: const BoxDecoration(
                  color: Constants.colorOnPrimary,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Center(
                    child: Icon(
                  Icons.circle,
                  color: isStepperActive
                      ? Constants.colorPrimary
                      : Constants.colorDotLine,
                  size: 20,
                )),
              ),
            ),
            isDotted
                ? const DottedLine(
                    direction: Axis.vertical,
                    lineLength: 30,
                    lineThickness: 2.0,
                    dashLength: 6.0,
                    dashColor: Constants.colorDotLine,
                    dashRadius: 0.0,
                    dashGapLength: 4.0,
                    dashGapColor: Colors.transparent,
                    dashGapRadius: 0.0,
                  )
                : const SizedBox()
          ],
        ),
        const SizedBox(width: 5),
        Expanded(
            child: Text(
          text,
          style: TextStyle(
              fontFamily: Constants.cairoSemibold,
              fontSize: 14,
              color: isStepperActive
                  ? Constants.colorOnSecondary
                  : Constants.colorDotLine),
        ))
      ],
    );
  }
}
