import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_nti5/features/add_and_edit_task/data/repos/add_task_repo.dart';

import 'add_task_state.dart';


class AddTaskCubit extends Cubit<AddTaskState>{
  AddTaskCubit(): super(AddTaskInitialState());
  static AddTaskCubit get(context)=> BlocProvider.of(context);

  AddTaskRepo repo = AddTaskRepo();
  final title = TextEditingController();
  final description = TextEditingController();
  final dateController = TextEditingController();
  String? imagePath;
  final formKey = GlobalKey<FormState>();


  addTask() async{
    emit(AddTaskLoadingState());
    var result = await repo.addTaskRepo(
        title: title.text,
        description: description.text,
        imagePath: imagePath
    );

    result.fold(
            (errorMSG)=> emit(AddTaskErrorState(error: errorMSG)),
            (success)=> emit(AddTaskSuccessState(success: success))
    );

  }
}