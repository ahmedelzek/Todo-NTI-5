import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_nti5/features/home/cubit/home_state.dart';
import 'package:todo_nti5/features/home/data/repos/get_tasks_repo.dart';
import 'package:todo_nti5/features/home/data/repos/get_user_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  GetTasksRepo repo = GetTasksRepo();
  GetUserRepo getUserRepo = GetUserRepo();

  void getTasks() async {
    emit(HomeLoadingState());
    var result = await repo.getTasks();
    var userResult = await getUserRepo.getUserData();
    result.fold(
      (error) => emit(HomeErrorState(error: error.toString())),
      (tasks) => userResult.fold(
        (error) => emit(HomeErrorState(error: error)),
        (userModel) =>
            emit(HomeSuccessState(tasks: tasks, userModel: userModel)),
      ),
    );
  }
}
