import 'package:equatable/equatable.dart';

class SettingScreenBlocState extends Equatable{
  final bool isNotification;
  final bool isEnglish;


  const SettingScreenBlocState({required this.isNotification, required this.isEnglish});

  const SettingScreenBlocState.initial():this(isEnglish: true,isNotification: true);

  SettingScreenBlocState copyWith({bool? isNotification,bool?isEnglish})=>SettingScreenBlocState(
    isNotification: isNotification??this.isNotification,
    isEnglish: isEnglish??this.isEnglish
  );

  @override
  List<Object?> get props =>[isNotification,isEnglish];

}