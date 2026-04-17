import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:todo_nti5/core/network/api_helper.dart';
import 'package:todo_nti5/core/network/end_points.dart';

import '../../../../core/network/api_response.dart';

class AddTaskRepo {
  APIHelper apiHelper = APIHelper();

  Future<Either<String, String>> addTaskRepo({
    String? title,
    String? description,
    String? imagePath,
  }) async {
    try {
      var response = await apiHelper.postRequest(
        endPoint: EndPoints.addTask,
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
}
