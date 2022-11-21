import 'package:beehive/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleWithPriceItem extends StatelessWidget {
  final String title;
  final String value;
  final TextStyle? style;
  const TitleWithPriceItem({required this.value,required this.title,this.style});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
           Text(title,
              textAlign: TextAlign.end,
              style: const TextStyle(
                  fontSize: 14,
                  color: Constants.colorOnSecondary,
                  fontFamily: Constants.cairoRegular)),
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(value,
                  style:style?? const TextStyle(
                      color: Constants.colorOnSecondary,
                      fontSize: 14,
                      fontFamily: Constants.cairoSemibold)),
              Image.asset('assets/dollar.png', height: 10, width: 10),
            ],
          ),
        ],
      ),
    );
  }
}
