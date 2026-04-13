
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit(): super(LoginInitial());
  static LoginCubit get(context)=> BlocProvider.of(context);

  AuthRepo repo = AuthRepo();
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool passwordSecure = true;
  void changePasswordVisibility(){
    passwordSecure = !passwordSecure;
    emit(ChangePasswordVisibility());
  }

  login() async{
    if(formKey.currentState?.validate() == false) return;

    emit(LoginLoading());
    var result = await repo.login(
        username: emailController.text,
        password: passwordController.text
    );

    result.fold(
            (errorMSG)=> emit(LoginError(error: errorMSG)),
            (model)=> emit(LoginSuccess(userModel: model))
    );

  }
}
