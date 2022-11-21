import 'package:beehive/ui/main/main_screen_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenBloc extends Cubit<MainScreenState> {

  MainScreenBloc() : super(const MainScreenState.initial());
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey globalKey = GlobalKey(debugLabel: 'btm_app_bar');

  BuildContext? textFieldContext;

  void updateIndex(index) {
    if (index != state.index) {
      emit(state.copyWith(index: index));
    }
  }

}
