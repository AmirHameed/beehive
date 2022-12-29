import 'package:equatable/equatable.dart';

class SignupScreenBlocState extends Equatable{
  final bool isPassword;
  final bool isConfirmPassword;


  const SignupScreenBlocState({required this.isPassword, required this.isConfirmPassword});

  const SignupScreenBlocState.initial():this(isPassword: true,isConfirmPassword: true);

  SignupScreenBlocState copyWith({bool? isPassword,bool?isConfirmPassword})=>SignupScreenBlocState(
      isPassword: isPassword??this.isPassword,
      isConfirmPassword: isConfirmPassword??this.isConfirmPassword
  );

  @override
  List<Object?> get props =>[isPassword,isConfirmPassword];
}