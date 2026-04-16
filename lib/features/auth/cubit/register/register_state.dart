abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  String successMsg;
  RegisterSuccessState({required this.successMsg});
}

class RegisterErrorState extends RegisterState {
  String errorMsg;
  RegisterErrorState({required this.errorMsg});
}
