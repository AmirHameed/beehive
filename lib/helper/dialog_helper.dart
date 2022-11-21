import 'dart:async';

import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/ui/common/app_button.dart';
import 'package:beehive/ui/common/app_text_field.dart';
import 'package:beehive/ui/provider_offers_screen.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DialogHelper {
  static DialogHelper? _instance;

  DialogHelper._();

  static DialogHelper instance() {
    _instance ??= DialogHelper._();
    return _instance!;
  }

  BuildContext? _context;

  void injectContext(BuildContext context) => _context = context;

  void dismissProgress() {
    final context = _context;
    if (context == null) return;
    Navigator.pop(context);
  }

  void showProgressDialog(String progressContent) {
    final context = _context;
    if (context == null) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => WillPopScope(
            child: Dialog(
                insetPadding: const EdgeInsets.symmetric(horizontal: 25),
                backgroundColor: Constants.colorOnPrimary,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16))),
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(strokeWidth: 2),
                          const SizedBox(width: 15),
                          Text(progressContent,
                              style: const TextStyle(
                                  color: Constants.colorOnSurface,
                                  fontSize: 15))
                        ]))),
            onWillPop: () async => false));
  }

  void showWriteReviewDialog(Function(String) onSubmitClosure) {
    final context = _context;
    if (context == null) return;

    final size = context.screenSize;
    final feedBackController = TextEditingController();

    String feedBackError = '';
    Function? feedBackStateSetter;
    bool isProvider=true;
    Function? providerStateSetter;


    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            backgroundColor: Constants.colorOnSurface,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: SingleChildScrollView(
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                    width: size.width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(AppText.WRITE_A_REVIEW,
                                  style: TextStyle(
                                      color: Constants.colorOnSecondary,
                                      fontFamily: Constants.cairoBold,
                                      fontSize: 14))),
                          const SizedBox(height: 10),
                          Container(
                            height: 60,
                            width: size.width,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Constants.colorLightPink),
                            child: StatefulBuilder(
                              builder: (_,setState){
                                providerStateSetter=setState;
                              return Row(
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap:()=> providerStateSetter?.call(()=>isProvider=false),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            color: !isProvider? Constants.colorPrimary:Colors.transparent),
                                        child:  Text(AppText.RESTURANT,
                                            style: TextStyle(
                                                color: !isProvider? Colors.white:Constants.colorPrimary,
                                                fontFamily: Constants.cairoSemibold,
                                                fontSize: 14)),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap:()=> providerStateSetter?.call(()=>isProvider=true),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(30),
                                            color:isProvider? Constants.colorPrimary:Colors.transparent),
                                        child:  Text(
                                          AppText.PROVIDER,
                                          style: TextStyle(
                                              color:isProvider? Colors.white:Constants.colorPrimary,
                                              fontFamily: Constants.cairoSemibold,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              );}

                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: RatingBar(
                                initialRating: 3.0,
                                itemSize: 20,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                allowHalfRating: true,
                                ratingWidget: RatingWidget(
                                    full: Image.asset('assets/full.png',
                                        width: 35,
                                        height: 35,
                                        fit: BoxFit.cover),
                                    half: const Icon(Icons.star_half, size: 30),
                                    empty: Image.asset('assets/empty.png',
                                        width: 35,
                                        height: 35,
                                        fit: BoxFit.cover)),
                                onRatingUpdate: (_) {},
                                ignoreGestures: true),
                          ),
                          AppTextField(
                              hint: 'Write your experience',
                              isError: false,
                              onChanged: (String? description) {},
                              maxLine: 5,
                              controller: feedBackController,
                              textInputType: TextInputType.multiline,
                              textInputAction: TextInputAction.next),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 10),
                            child: SizedBox(
                                height: 48,
                                width: size.width,
                                child: AppButton(
                                    onClick: () {},
                                    text: AppText.Submit,
                                    textColor: Constants.colorOnSurface,
                                    borderRadius: 12.0,
                                    fontSize: 14,
                                    color: Constants.colorPrimary)),
                          ),
                        ])))));
  }

  String getText(timerMaxSeconds, currentSeconds) =>
      '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')}: ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')}';

  void showRequestSentDialog(Function() onCancelClosure) {
    final context = _context;
    if (context == null) return;
    final size = context.screenSize;
    const interval = Duration(seconds: 1);

    const int timerMaxSeconds = 120;

    int currentSeconds = 0;
    Function? timerStateSetter;
    startTimeout() {
      var duration = interval;
      Timer.periodic(duration, (timer) {
        timerStateSetter?.call(() {
          if (timer.tick == 5) {
            timer.cancel();
            Navigator.pop(context);
            Navigator.pushNamed(context, ProviderOfferScreen.route);
          }
          currentSeconds = timer.tick;
          if (timer.tick >= timerMaxSeconds) timer.cancel();
        });
      });
    }

    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) {
          startTimeout();
          return AlertDialog(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              insetPadding: const EdgeInsets.symmetric(horizontal: 20),
              backgroundColor: Constants.colorOnSurface,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              content: SingleChildScrollView(
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                    width: size.width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          StatefulBuilder(builder: (_, setState) {
                            timerStateSetter = setState;
                            return SizedBox(
                              width: 80,
                              height: 80,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  CircularProgressIndicator(
                                    value: currentSeconds / timerMaxSeconds,
                                    valueColor: const AlwaysStoppedAnimation(Constants.colorPrimary),
                                    strokeWidth: 4,
                                    backgroundColor: Constants.colorTextLight3,
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        // Icon(Icons.timer),
                                        const SizedBox(
                                          width: 5,
                                        ),

                                        Text(
                                          getText(
                                              timerMaxSeconds, currentSeconds),
                                          style: const TextStyle(
                                              color:
                                                  Constants.colorOnSecondary),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(AppText.YOUR_REQUEST_SENT_TO_PROVIDER,
                                  style: TextStyle(
                                      color: Constants.colorOnSecondary,
                                      fontFamily: Constants.cairoBold,
                                      fontSize: 14))),
                          const Padding(
                              padding: EdgeInsets.only(top: 12),
                              child: Text(
                                  AppText
                                      .PLEASE_UNTIL_ONE_OF_THE_REPRESENTATIVE,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Constants.colorOnSecondary,
                                      fontFamily: Constants.cairoLight,
                                      fontSize: 12))),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10, top: 15),
                            child: SizedBox(
                                height: 48,
                                width: size.width,
                                child: AppButton(
                                    onClick: onCancelClosure,
                                    text: AppText.CANCEL_ORDER,
                                    textColor: Constants.colorError,
                                    borderRadius: 12.0,
                                    fontSize: 14,
                                    borderColor: Constants.colorError,
                                    color: Colors.white)),
                          ),
                        ])),
              ));
        });
  }

  void showNoResponseReorderDialog(
      Function() onCancelClosure, Function() onReorder) {
    final context = _context;
    if (context == null) return;
    final size = context.screenSize;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            backgroundColor: Constants.colorOnSurface,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: SingleChildScrollView(
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                  width: size.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularPercentIndicator(
                          radius: 40.0,
                          lineWidth: 5.0,
                          percent: 1.0,
                          animation: true,
                          animationDuration: 2000,
                          center: const Text('00:00'),
                          progressColor: Constants.colorPrimary,
                        ),
                        const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(AppText.THERE_IS_NO_RESPONSE,
                                style: TextStyle(
                                    color: Constants.colorOnSecondary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14))),
                        const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(AppText.YOU_CAN_REORDER_OR_CANCEL_ORDER,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Constants.colorOnSecondary,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12))),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, top: 10),
                                child: SizedBox(
                                    height: 48,
                                    width: size.width,
                                    child: AppButton(
                                        onClick: onCancelClosure,
                                        text: AppText.CANCEL_ORDER,
                                        textColor: Constants.colorError,
                                        borderRadius: 12.0,
                                        fontSize: 14,
                                        borderColor: Constants.colorError,
                                        color: Colors.white)),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, top: 10),
                                child: SizedBox(
                                    height: 48,
                                    width: size.width,
                                    child: AppButton(
                                        onClick: onReorder,
                                        text: AppText.RE_ORDER,
                                        textColor: Constants.colorOnPrimary,
                                        borderRadius: 12.0,
                                        fontSize: 14,
                                        color: Constants.colorPrimary)),
                              ),
                            ),
                          ],
                        ),
                      ])),
            )));
  }

  void showDeleteDialog() {
    final context = _context;
    if (context == null) return;
    final size = context.screenSize;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            backgroundColor: Constants.colorOnSurface,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: SingleChildScrollView(
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                  width: size.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                            image: AssetImage('assets/delete_icon.png'),
                            width: 50,
                            height: 50),
                        const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(AppText.ARE_YOU_SURE,
                                style: TextStyle(
                                    color: Constants.colorOnSecondary,
                                    fontFamily: Constants.cairoBold,
                                    fontSize: 14))),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, top: 10),
                                child: SizedBox(
                                    height: 48,
                                    width: size.width,
                                    child: AppButton(
                                        onClick: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        text: AppText.YES,
                                        textColor: Constants.colorError,
                                        borderRadius: 12.0,
                                        fontSize: 14,
                                        borderColor: Constants.colorError,
                                        color: Colors.white)),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, top: 10),
                                child: SizedBox(
                                    height: 48,
                                    width: size.width,
                                    child: AppButton(
                                        onClick: () {
                                          Navigator.pop(context);
                                        },
                                        text: AppText.NO,
                                        textColor: Constants.colorOnPrimary,
                                        borderRadius: 12.0,
                                        fontSize: 14,
                                        color: Constants.colorPrimary)),
                              ),
                            ),
                          ],
                        ),
                      ])),
            )));
  }
  void showDeleteDialogCart() {
    final context = _context;
    if (context == null) return;
    final size = context.screenSize;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            insetPadding: const EdgeInsets.symmetric(horizontal: 20),
            backgroundColor: Constants.colorOnSurface,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            content: SingleChildScrollView(
              padding: const EdgeInsets.all(0),
              child: SizedBox(
                  width: size.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                            image: AssetImage('assets/delete_icon.png'),
                            width: 50,
                            height: 50),
                        const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(AppText.ARE_YOU_SURE,
                                style: TextStyle(
                                    color: Constants.colorOnSecondary,
                                    fontFamily: Constants.cairoBold,
                                    fontSize: 14))),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, top: 10),
                                child: SizedBox(
                                    height: 48,
                                    width: size.width,
                                    child: AppButton(
                                        onClick: () {
                                          Navigator.pop(context);
                                        },
                                        text: AppText.YES_DELETE,
                                        textColor: Constants.colorError,
                                        borderRadius: 12.0,
                                        fontSize: 14,
                                        borderColor: Constants.colorError,
                                        color: Colors.white)),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, top: 10),
                                child: SizedBox(
                                    height: 48,
                                    width: size.width,
                                    child: AppButton(
                                        onClick: () {
                                          Navigator.pop(context);
                                        },
                                        text: AppText.NO_KEEP,
                                        textColor: Constants.colorOnPrimary,
                                        borderRadius: 12.0,
                                        fontSize: 14,
                                        color: Constants.colorPrimary)),
                              ),
                            ),
                          ],
                        ),
                      ])),
            )));
  }
}
