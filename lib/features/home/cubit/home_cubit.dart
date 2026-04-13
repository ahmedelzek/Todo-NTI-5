import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_nti5/features/home/cubit/home_state.dart';
import 'package:todo_nti5/features/home/data/models/task_model.dart';
import 'package:todo_nti5/features/home/data/repos/get_tasks_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  GetTasksRepo repo = GetTasksRepo();
  List<TaskModel> tasks = [];

  getTasks() async {
    emit(HomeLoadingState());
    var result = await repo.getTasks();
    result.fold((error) => emit(HomeErrorState(error: error.toString())), (
      tasks,
    ) {
      this.tasks = tasks;
      emit(HomeSuccessState());
    });
  }
}
