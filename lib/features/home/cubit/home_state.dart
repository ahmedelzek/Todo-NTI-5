import 'package:todo_nti5/features/auth/data/models/user_model.dart';
import 'package:todo_nti5/features/home/data/models/task_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  List<TaskModel> tasks;
  UserModel userModel;

  HomeSuccessState({required this.tasks, required this.userModel});
}

class HomeErrorState extends HomeState {
  String error;

  HomeErrorState({required this.error});
}
