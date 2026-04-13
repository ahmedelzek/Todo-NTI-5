import 'package:dartz/dartz.dart';
import 'package:todo_nti5/core/network/api_response.dart';
import 'package:todo_nti5/core/network/end_points.dart';

import '../../../../core/network/api_helper.dart';
import '../models/task_model.dart';

class GetTasksRepo {
  APIHelper apiHelper = APIHelper();

  Future<Either<String, List<TaskModel>>> getTasks() async {
    try {
      var registerResponse = await apiHelper.getRequest(
        endPoint: EndPoints.myTasks,
      );
      if (registerResponse.status) {
        var tasksResponse = registerResponse.data as Map<String, dynamic>;
        List<TaskModel> tasks = [];
        for (var taskJson in tasksResponse['tasks']) {
          tasks.add(TaskModel.fromJson(taskJson));
        }
        return Right(tasks);
      } else {
        return Left(registerResponse.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }
}

//static Future<Either<String, List<TaskModel>>> getTasks() async {
//     try {
//       var registerResponse = await _dio.get('my_tasks',
//           options: Options(headers: {
//             'Authorization':
//             'Bearer ${await CacheHelper.getValue(CacheKeys.accessToken)}'
//           }));
//       var tasksResponse = registerResponse.data as Map<String, dynamic>;
//       List<TaskModel> tasks = [];
//       for (var taskJson in tasksResponse['tasks']) {
//         tasks.add(TaskModel.fromJson(taskJson));
//       }
//       return Right(tasks);
//     } catch (e) {
//       if (e is DioException) {
//         var errorResponse = e.response?.data as Map<String, dynamic>;
//         return Left(errorResponse['message'] ?? 'Unknown error');
//       } else {
//         print(e.toString());
//         return Left('An Error occurred.\nTry again later');
//       }
//     }
//   }
