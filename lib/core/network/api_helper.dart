import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_nti5/core/cache/cache_constants.dart';

import '../../features/auth/data/models/login_response_model.dart';
import '../../features/auth/data/models/register_response_model.dart';
import '../../features/auth/data/models/user_model.dart';
import '../../features/home/data/tasks_model.dart';
import '../app_router/app_router.dart';
import '../app_router/app_router_keys.dart';
import '../cache/cache_helper.dart';
import 'end_points.dart';

abstract class APIHelper {
  static final _dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));
  static bool _isRefreshing = false;



  static void init() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          if (error.response?.statusCode == 401 && !_isRefreshing) {
            _isRefreshing = true;

            final refreshed = await _refreshAccessToken();

            if (refreshed) {
              _isRefreshing = false;

              final newToken = CacheHelper.getValue(CacheConstants.accessToken);
              final options = error.requestOptions;
              options.headers['Authorization'] = 'Bearer $newToken';

              final retryResponse = await _dio.fetch(options);
              return handler.resolve(retryResponse);
            } else {
              _isRefreshing = false;
              await _logout();
            }
          }

          return handler.next(error);
        },
      ),
    );
  }


  static Future<bool> _refreshAccessToken() async {
    try {
      final storedRefreshToken = CacheHelper.getValue(CacheConstants.refreshToken);

      final response = await _dio.post(
        EndPoints.refreshToken,
        data: FormData.fromMap({'refresh_token': storedRefreshToken}),
      );

      final newAccessToken = response.data['access_token'];
      final newRefreshToken = response.data['refresh_token'];

      await CacheHelper.setValue(CacheConstants.accessToken, newAccessToken);
      if (newRefreshToken != null) {
        await CacheHelper.setValue(CacheConstants.refreshToken, newRefreshToken);
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> _logout() async {
    await CacheHelper.removeValue(CacheConstants.accessToken);
    await CacheHelper.removeValue(CacheConstants.refreshToken);
    await CacheHelper.removeValue(CacheConstants.userModel);

    navigatorKey.currentContext?.go(AppRouterKeys.login);
  }

  static Future<Either<String, UserModel>> login({
    required String username,
    required String password,
  }) async {
    try {
      var loginResponse = await _dio.post(
        EndPoints.login,
        data: FormData.fromMap({'username': username, 'password': password}),
      );
      var loginResponseModel = LoginResponseModel.fromJson(
        loginResponse.data as Map<String, dynamic>,
      );

      await CacheHelper.setValue(
        CacheConstants.accessToken,
        loginResponseModel.accessToken!,
      );
      await CacheHelper.setValue(
        CacheConstants.refreshToken,
        loginResponseModel.refreshToken!,
      );

      return Right(loginResponseModel.userModel!);
    } catch (e) {
      if (e is DioException) {
        var errorResponse = e.response?.data as Map<String, dynamic>;
        return Left(errorResponse['message'] ?? 'Unknown error');
      } else {
        return Left('An Error occurred.\nTry again later');
      }
    }
  }

  Future<Either<String, RegisterResponse>> register({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        EndPoints.register,
        data: FormData.fromMap({'username': username, 'password': password}),
      );

      final data = response.data as Map<String, dynamic>;
      final parsedResponse = RegisterResponse.fromJson(data);

      return Right(parsedResponse);
    } on DioException catch (e) {
      final errorData = e.response?.data;

      if (errorData is Map<String, dynamic>) {
        return Left(errorData['message'] ?? 'Unknown error');
      }

      return Left('Network error. Please try again.');
    } catch (e) {
      return Left('An error occurred. Try again later.');
    }
  }

  static Future<Either<String, List<TaskModel>>> getTasks()  async {
    try {
      var registerResponse = await _dio.get(
        'my_tasks',
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${await CacheHelper.getValue(CacheConstants.accessToken)}',
          },
        ),
      );
      var tasksResponse = registerResponse.data as Map<String, dynamic>;
      List<TaskModel> tasks = [];
      for (var taskJson in tasksResponse['tasks']) {
        tasks.add(TaskModel.fromJson(taskJson));
      }
      return Right(tasks);
    } catch (e) {
      if (e is DioException) {
        var errorResponse = e.response?.data as Map<String, dynamic>;
        return Left(errorResponse['message'] ?? 'Unknown error');
      } else {
        return Left('An Error occurred.\nTry again later');
      }
    }
  }
}
