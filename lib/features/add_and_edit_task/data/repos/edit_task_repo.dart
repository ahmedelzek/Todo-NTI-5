import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_nti5/core/network/api_helper.dart';
import 'package:todo_nti5/core/network/end_points.dart';

import '../../../../core/network/api_response.dart';

class EditTaskRepo {
  APIHelper apiHelper = APIHelper();

  Future<Either<String, String>> updateTaskRepo({
    required String taskId,
    String? title,
    String? description,
    String? imagePath,
  }) async {
    try {
      var response = await apiHelper.putRequest(
        endPoint: "${EndPoints.updateTask}/$taskId",
        data: {
          'title': title,
          'description': description,
          if (imagePath != null)
            'image': await MultipartFile.fromFile(imagePath),
        },
      );

      if (response.status) {
        // serialization
        return right(response.message);
      } else {
        return left(response.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }

  Future<Either<String, String>> delete ({required String taskId}) async{
    try {
      var response = await apiHelper.deleteRequest(
        endPoint: "${EndPoints.updateTask}/$taskId",
      );

      if (response.status) {
        // serialization
        return right(response.message);
      } else {
        return left(response.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }

}
