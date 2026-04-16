import 'package:dartz/dartz.dart';
import 'package:todo_nti5/core/network/api_helper.dart';
import 'package:todo_nti5/core/network/api_response.dart';

import '../../../../core/network/end_points.dart';
import '../../../auth/data/models/user_model.dart';

class GetUserRepo {
  APIHelper apiHelper = APIHelper();

  Future<Either<String, UserModel>> getUserData() async {
    try {
      var userDataResponse = await apiHelper.getRequest(
          endPoint: EndPoints.getUserData);

      if (userDataResponse.status) {
        var data = userDataResponse.data as Map<String, dynamic>;
        UserModel userModel = UserModel.fromJson(data['user']);
        return Right(userModel);
      }
      else {
        return left(userDataResponse.message);
      }
    } catch (e) {
      return left(ApiResponse.fromError(e).message);
    }
  }
}