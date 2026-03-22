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
  static final _refreshDio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));
  static final List<(DioException, ErrorInterceptorHandler)> _pendingRequests = [];
  static bool _isRefreshing = false;

  static void init() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          if (error.response?.statusCode == 401) {
            if (_isRefreshing) {
              _pendingRequests.add((error, handler));
              return;
            }

            _isRefreshing = true;
            final refreshed = await _refreshAccessToken();

            if (refreshed) {
              _isRefreshing = false;
              final newToken = CacheHelper.getValue(CacheConstants.accessToken);

              final options = error.requestOptions;
              options.headers['Authorization'] = 'Bearer $newToken';
              final retryResponse = await _dio.fetch(options);
              handler.resolve(retryResponse);

              for (final (pendingError, pendingHandler) in _pendingRequests) {
                pendingError.requestOptions.headers['Authorization'] = 'Bearer $newToken';
                final retryRes = await _dio.fetch(pendingError.requestOptions);
                pendingHandler.resolve(retryRes);
              }
              _pendingRequests.clear();
            } else {
              _isRefreshing = false;
              _pendingRequests.clear();
              await _logout();
            }
            return;
          }

          return handler.next(error);
        },
      ),
    );
  }
  static Future<bool> _refreshAccessToken() async {
    try {
      final storedRefreshToken = CacheHelper.getValue(CacheConstants.refreshToken);

      final response = await _refreshDio.post(
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

  static Future<Either<String, RegisterResponse>> register({
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

  static Future<Either<String, List<TaskModel>>> getTasks() async {
    try {
      var registerResponse = await _dio.get(
        EndPoints.myTasks,
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

  static Future<Either<String, String>> addTask({
    required String title,
    required String description,
  }) async {
    TaskModel newTask = TaskModel(title: title, description: description);

    try {
      var addResponse = await _dio.post(
        EndPoints.addTask,
        data: FormData.fromMap(newTask.toJson()),
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${await CacheHelper.getValue(CacheConstants.accessToken)}',
          },
        ),
      );
      var response = addResponse.data as Map<String, dynamic>;

      return Right(response['message'] ?? 'Task added successfully');
    } catch (e) {
      if (e is DioException) {
        var errorResponse = e.response?.data as Map<String, dynamic>;
        return Left(errorResponse['message'] ?? 'Unknown error');
      } else {
        return Left('An Error occurred.\nTry again later');
      }
    }
  }

  static Future<Either<String, String>> updateTask({
    required String taskId,
    required String newTitle,
    required String newDescription,
  }) async {
    try {
      var updateResponse = await _dio.put(
        '${EndPoints.updateTask}/$taskId',
        data: FormData.fromMap({
          'title': newTitle,
          'description': newDescription,
        }),
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${CacheHelper.getValue(CacheConstants.accessToken)}',
          },
        ),
      );
      return Right(
        updateResponse.data['message'] ?? 'Task updated successfully',
      );
    } catch (e) {
      if (e is DioException) {
        var errorResponse = e.response?.data as Map<String, dynamic>;
        return Left(errorResponse['message'] ?? 'Unknown error');
      } else {
        return Left('An Error occurred.\nTry again later');
      }
    }
  }

  static Future<Either<String, String>> deleteTask({
    required String taskId,
  }) async {
    try {
      var deleteResponse = await _dio.delete(
        '${EndPoints.updateTask}/$taskId',
        options: Options(
          headers: {
            'Authorization':
                'Bearer ${CacheHelper.getValue(CacheConstants.accessToken)}',
          },
        ),
      );
      return Right(deleteResponse.data['message'] ?? 'Task deleted successfully',);
    } catch (e) {
      if (e is DioException) {
        var errorResponse = e.response?.data as Map<String, dynamic>;
        return Left(errorResponse['message'] ?? 'Unknown error');
      } else {
        print(e.toString());
        return Left('An Error occurred.\nTry again later');
      }
    }
  }
}
