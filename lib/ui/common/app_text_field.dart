// ignore_for_file: prefer_const_constructors
import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hint;
  final int maxLine;
  final TextInputType textInputType;
  final bool isError;
  final TextInputAction textInputAction;
  final bool isObscure;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final bool readOnly;
  final Function()? onSuffixClick;

  const AppTextField(
      {required this.hint,
      required this.textInputType,
      required this.isError,
      this.controller,
      this.onChanged, this.maxLine=1,
      this.isObscure = false,
        this.readOnly=false,
      this.suffixIcon,
      this.onSuffixClick,
      this.prefixIcon,
      this.textInputAction = TextInputAction.next});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(bottom: 10, top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: isError ? Constants.colorError : Constants.colorTextLight3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            prefixIcon != null ? prefixIcon! : const SizedBox(),
            Expanded(
                child: TextFormField(
                    obscureText: isObscure,
                    controller: controller,
                    readOnly: readOnly,
                    onChanged: onChanged,
                    maxLines: maxLine,
                    keyboardType: textInputType,
                    textInputAction: textInputAction,
                    style: const TextStyle(color: Constants.colorOnSecondary, fontFamily: Constants.cairoRegular, fontSize: 14),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintText: hint,
                        hintStyle:
                            TextStyle(color: Constants.colorSecondary, fontFamily: Constants.cairoRegular, fontSize: 13)))),
            suffixIcon != null
                ? GestureDetector(
                    onTap: () => onSuffixClick?.call(),
                    child: Padding(padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5), child: suffixIcon!))
                : const SizedBox()
          ],
        ));
  }
}

class OtherAppTextField extends StatelessWidget {
  final String hint;
  final TextInputAction inputAction;
  final TextInputType textInputType;
  final bool isObscure;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const OtherAppTextField(
      {required this.hint,
      required this.inputAction,
      required this.textInputType,
      this.controller,
      this.onChanged,
      this.isObscure = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0xffE8E8E8), borderRadius: BorderRadius.all(Radius.circular(8))),
      child: TextField(
          textInputAction: inputAction,
          keyboardType: textInputType,
          cursorHeight: 20,
          controller: controller,
          cursorColor: Constants.colorPrimaryVariant,
          onChanged: onChanged,
          maxLines: textInputType == TextInputType.multiline ? null : 1,
          obscureText: isObscure,
          style: const TextStyle(color: Color(0xff4A4A4A), fontSize: 14),
          decoration: InputDecoration(
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              contentPadding: const EdgeInsets.only(left: 10, right: 10),
              enabledBorder: InputBorder.none,
              hintText: hint,
              hintStyle: TextStyle(color: const Color(0xff4A4A4A).withOpacity(0.7), fontSize: 14))),
    );
  }
}
