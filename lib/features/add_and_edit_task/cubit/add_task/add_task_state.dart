abstract class AddTaskState {}

class AddTaskInitialState extends AddTaskState {}

class AddTaskLoadingState extends AddTaskState {}

class AddTaskSuccessState extends AddTaskState {
  String success;
  AddTaskSuccessState({required this.success});
}

class AddTaskErrorState extends AddTaskState {
  String error;
  AddTaskErrorState({required this.error});
}
