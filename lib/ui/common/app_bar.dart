import 'package:beehive/utils/app_strings.dart';
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';

class AppBarItem extends StatelessWidget {
  final String title;
  const AppBarItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 22,
                    color: Constants.colorOnSecondary,
                  )),
               Text(title,
                  style: const TextStyle(
                      color: Constants.colorOnSecondary,
                      fontSize: 16,
                      fontFamily: Constants.cairoBold)),
              const SizedBox()
            ],
          ),
        ),
        const Divider(
          thickness: 1,
          color: Constants.colorTextLight2,
          height: 1,
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
