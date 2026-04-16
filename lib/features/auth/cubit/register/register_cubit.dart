import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_nti5/features/auth/cubit/register/register_state.dart';
import 'package:todo_nti5/features/auth/data/repo/auth_repo.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());
  static RegisterCubit get(context) => BlocProvider.of(context);
  AuthRepo repo = AuthRepo();

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final usernameController = TextEditingController();
  String? imagePath;

  Future<void> register() async {
    emit(RegisterLoadingState());
    var result = await repo.register(
      username: usernameController.text,
      password: passwordController.text,
      imagePath: imagePath
    );

    result.fold(
      (errorMsg) => emit(RegisterErrorState(errorMsg: errorMsg)),
      (successMsg) => emit(RegisterSuccessState(successMsg: successMsg)),
    );
  }
}
