import 'package:beehive/custom_icon_icons.dart';
import 'package:beehive/extension/context_extension.dart';
import 'package:beehive/helper/dialog_helper.dart';
import 'package:beehive/ui/common/app_button.dart';
import 'package:beehive/ui/payment-method/payment_method_screen_bloc.dart';
import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PaymentMethodScreen extends StatelessWidget {
  static const String route = 'payment_method_screen_route';

  const PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dialogHelper = DialogHelper.instance();
    final size = context.screenSize;

    final bloc=context.read<PaymentMethodScreenBloc>();
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PaymentMethodScreenBloc,int>(
          builder: (_,state)=>
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context,-1),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 22,
                        color: Constants.colorOnSecondary,
                      )),
                  const Text(AppText.PAYMENT_METHODS,
                      style: TextStyle(
                          color: Constants.colorOnSecondary,
                          fontSize: 16,
                          fontFamily: Constants.cairoBold)),
                  GestureDetector(
                    onTap: () {
                      showAddPaymentMethodBottomSheet(context);
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
            GestureDetector(
              onTap: (){
                bloc.updateIndex(3);
              },
              child: Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color:state==3?Constants.colorPrimary:  Constants.colorTextLight3)),
                child:  const Text(AppText.WALLET,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                        fontSize: 14,
                        color:Constants.colorOnSecondary,
                        fontFamily: Constants.cairoSemibold)),
              ),
            ),
            const SizedBox(height: 10),



            ListView.separated(
              separatorBuilder: (_,__)=>const SizedBox(height: 10),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (_,index)=>
              Slidable(
                endActionPane:
                  ActionPane(
                      extentRatio: 0.3,
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                            onPressed: (_){
                              dialogHelper
                                ..injectContext(context)
                                ..showDeleteDialogCart();
                            },
                            backgroundColor: Colors.transparent,
                            icon:Icons.delete,
                            label: '',
                            padding: const EdgeInsets.only(top: 10),
                            foregroundColor: Colors.red,
                            spacing: 0)
                      ]),
                child: GestureDetector(
                  onTap: ()=>bloc.updateIndex(index),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 1, color:state==index?Constants.colorPrimary: Constants.colorTextLight3)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('**** **** **** 6544',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Constants.colorOnSecondary,
                                    fontFamily: Constants.cairoSemibold)),
                            SizedBox(height: 20),
                            Text('12/23',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Constants.colorOnSecondary,
                                    fontFamily: Constants.cairoSemibold))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Image.asset(index==0?'assets/visa.png':index==1?'assets/master.png':'assets/1200px-Mada_Logo 2.png', width: 70, height: 40),
                            const SizedBox(height: 10),
                            const Text('Expired',
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Constants.colorOnSecondary,
                                    fontFamily: Constants.cairoSemibold))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bloc.isShippingAddress?
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
              child: SizedBox(
                height: 48,
                width: size.width,
                child: AppButton(
                    onClick: () {
                      if (state==-1 || !bloc.isShippingAddress) return;
                      Navigator.pop(context,state);
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
                        : Constants.colorPrimaryLight),
              ),
            ):const SizedBox()
          ]),
        ),
      ),
    );
  }
}

showAddPaymentMethodBottomSheet(BuildContext context) {
  final _formkey = GlobalKey<FormState>();
  final size = context.screenSize;

  return showModalBottomSheet(
    context: context,
    enableDrag: true,
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
          const Text(AppText.ADD_PAYMENT_METHOD,
              style: TextStyle(
                  fontSize: 16,
                  color: Constants.colorOnSecondary,
                  fontWeight: FontWeight.w600)),
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(AppText.NAME,
                      style: TextStyle(
                          fontSize: 14, color: Constants.colorOnSecondary)),
                  Container(
                      height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(
                          bottom: 20, top: 10, left: 0, right: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Constants.colorTextLight)),
                      child: TextFormField(
                          controller: TextEditingController(),
                          onChanged: (String? value) {},
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              color: Constants.colorOnSecondary, fontSize: 14),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'Enter',
                              hintStyle: TextStyle(
                                  color: Constants.colorTextLight,
                                  fontSize: 13)))),
                  const Text(AppText.CARD_NUMBER,
                      style: TextStyle(
                          fontSize: 14, color: Constants.colorOnSecondary)),
                  Container(
                      height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.only(
                          bottom: 20, top: 10, left: 0, right: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(color: Constants.colorTextLight)),
                      child: TextFormField(
                          controller: TextEditingController(),
                          onChanged: (String? value) {},
                          keyboardType: TextInputType.text,
                          style: const TextStyle(
                              color: Constants.colorOnSecondary, fontSize: 14),
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'xxxx xxxx xxxx xxxx',
                              hintStyle: TextStyle(
                                  color: Constants.colorTextLight,
                                  fontSize: 13)))),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(AppText.EXPIRE_DATE,
                                style: TextStyle(
                                    fontSize: 14, color: Constants.colorOnSecondary)),

                            Container(
                                height: 48,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                margin: const EdgeInsets.only(
                                    bottom: 20, top: 10, left: 0, right: 0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(color: Constants.colorTextLight)),
                                child: TextFormField(
                                    controller: TextEditingController(),
                                    onChanged: (String? value) {},
                                    keyboardType: TextInputType.text,
                                    style: const TextStyle(
                                        color: Constants.colorOnSecondary, fontSize: 14),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: '12/23',
                                        hintStyle: TextStyle(
                                            color: Constants.colorTextLight,
                                            fontSize: 13))))
                          ],
                        ),
                      ),

                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(AppText.CVV,
                                style: TextStyle(
                                    fontSize: 14, color: Constants.colorOnSecondary)),

                            Container(
                                height: 48,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                margin: const EdgeInsets.only(
                                    bottom: 20, top: 10, left: 0, right: 0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    border: Border.all(color: Constants.colorTextLight)),
                                child: TextFormField(
                                    controller: TextEditingController(),
                                    onChanged: (String? value) {},
                                    keyboardType: TextInputType.text,
                                    style: const TextStyle(
                                        color: Constants.colorOnSecondary, fontSize: 14),
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: '1234',
                                        hintStyle: TextStyle(
                                            color: Constants.colorTextLight,
                                            fontSize: 13))))
                          ],
                        ),
                      ),
                    ],
                  ),
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
          ),
        ],
      );
    },
  );
}

