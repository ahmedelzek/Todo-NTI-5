import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_nti5/features/add_and_edit_task/cubit/edit_task/edit_task_state.dart';
import 'package:todo_nti5/features/add_and_edit_task/data/repos/edit_task_repo.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  EditTaskCubit() : super(EditTaskInitialState());

  static EditTaskCubit get(context) => BlocProvider.of(context);
  EditTaskRepo repo = EditTaskRepo();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  delete(String taskId) async {
    emit(EditTaskLoadingState());
    var result = await repo.delete(taskId: taskId);
    result.fold(
      (error) => emit(EditTaskErrorState(error: error)),
      (success) => emit(EditTaskSuccessState(success: success)),
    );
  }

  update(String taskId) async {
    emit(EditTaskLoadingState());
    var result = await repo.updateTaskRepo(
      taskId: taskId,
      title: titleController.text,
      description: descriptionController.text,
    );
    result.fold(
      (error) => emit(EditTaskErrorState(error: error)),
      (success) => emit(EditTaskSuccessState(success: success)),
    );
  }
}
