import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenBloc extends Cubit<bool>{
  LoginScreenBloc():super(true);

  void togglePasswordObscure() =>
      emit(!state);
}