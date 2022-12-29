import 'package:equatable/equatable.dart';

class NewPasswordScreenBlocState extends Equatable{
  final bool isNewPassword;
  final bool isConfirmNewPassword;


  const NewPasswordScreenBlocState({required this.isNewPassword, required this.isConfirmNewPassword});

  const NewPasswordScreenBlocState.initi():this(isNewPassword: true,isConfirmNewPassword: true);

  NewPasswordScreenBlocState copyWith({bool? isNewPassword,bool?isConfirmNewPassword})=>NewPasswordScreenBlocState(
      isNewPassword: isNewPassword??this.isNewPassword,
      isConfirmNewPassword: isConfirmNewPassword??this.isConfirmNewPassword
  );

  @override
  List<Object?> get props =>[isNewPassword,isConfirmNewPassword];

}