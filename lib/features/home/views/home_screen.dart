import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/customized_widgets/customized_list_task_item.dart';
import 'package:todo_nti5/core/customized_widgets/customized_tasks_counter.dart';
import 'package:todo_nti5/core/customized_widgets/empty_tasks_prompt.dart';
import 'package:todo_nti5/core/customized_widgets/header_profile.dart';
import 'package:todo_nti5/core/network/api_helper.dart';

import '../../../core/cache/cache_constants.dart';
import '../../../core/cache/cache_helper.dart';
import '../../auth/data/models/user_model.dart';
import '../data/tasks_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserModel? userModel;
  List< TaskModel> tasks = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    final cachedValue = CacheHelper.getValue(CacheConstants.userModel);
    if (cachedValue != null && cachedValue is String) {
      userModel = UserModel.fromJson(jsonDecode(cachedValue));
    }
    fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              HeaderProfile(userName: userModel?.username ?? "User"),
              Visibility(
                visible: tasks.isNotEmpty,
                child: customizedTasksCounter(title: "Tasks", count: tasks.length),
              ),
              Expanded(
                child:
                    isLoading
                        ? Center(child: CircularProgressIndicator())
                        : errorMessage != null
                        ? Center(child: Text(errorMessage!))
                        : tasks.isEmpty
                        ? EmptyTasksPrompt()
                        : ListView.builder(
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            final task = tasks[index];
                            return CustomizedListTaskItem(
                              title: task.title ?? '',
                              description: task.description ?? '',
                              date: extractDate(task.createdAt),
                              time: extractTime(task.createdAt),
                            );
                          },
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void fetchTasks() async {
    final result = await APIHelper.getTasks();
    result.fold(
      (error) {
        setState(() {
          errorMessage = error;
          isLoading = false;
        });
      },
      (fetchedTasks) {
        setState(() {
          tasks = fetchedTasks;
          isLoading = false;
        });
      },
    );
  }

  String extractDate(String? createdAt) {
    if (createdAt == null) return '';
    return createdAt.split('T').first;
  }

  String extractTime(String? createdAt) {
    if (createdAt == null) return '';
    try {
      final dateTime = DateTime.parse(createdAt);
      final hour = dateTime.hour.toString().padLeft(2, '0');
      final minute = dateTime.minute.toString().padLeft(2, '0');
      return '$hour:$minute';
    } catch (e) {
      return '';
    }
  }
}
