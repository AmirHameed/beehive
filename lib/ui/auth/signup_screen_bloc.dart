import 'package:beehive/ui/auth/signup_screen_bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreenBloc extends Cubit<SignupScreenBlocState>{
  SignupScreenBloc():super(const SignupScreenBlocState.initial());


  void togglePasswordObscure() =>
      emit(state.copyWith(isPassword: !state.isPassword));

  void toggleConfirmPasswordObscure() =>
      emit(state.copyWith(isConfirmPassword: !state.isConfirmPassword));
}