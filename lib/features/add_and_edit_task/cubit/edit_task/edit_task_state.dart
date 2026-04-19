abstract class EditTaskState {}

class EditTaskInitialState extends EditTaskState {}

class EditTaskLoadingState extends EditTaskState {}

class EditTaskSuccessState extends EditTaskState {
  String success;

  EditTaskSuccessState({required this.success});
}

class EditTaskErrorState extends EditTaskState {
  String error;

  EditTaskErrorState({required this.error});
}
