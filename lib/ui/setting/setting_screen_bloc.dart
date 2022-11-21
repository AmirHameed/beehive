import 'package:beehive/ui/setting/setting_screen_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingScreenBloc extends Cubit<SettingScreenBlocState>{
  SettingScreenBloc():super(const SettingScreenBlocState.initial());

  void changeValue(bool value){
    emit(state.copyWith(isNotification: value));
  }
  void changeLanguage(bool value){
    emit(state.copyWith(isEnglish: value));
  }

}