import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/customized_widgets/customized_list_task_item.dart';
import 'package:todo_nti5/core/customized_widgets/customized_tasks_counter.dart';
import 'package:todo_nti5/core/customized_widgets/empty_tasks_prompt.dart';
import 'package:todo_nti5/core/customized_widgets/header_profile.dart';

import '../../core/cache/cache_constants.dart';
import '../../core/cache/cache_helper.dart';
import '../../core/demo_data/demo_tasks_data.dart';
import '../auth/data/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  UserModel? userModel;

  @override
  void initState() {
    super.initState();
    final cachedValue = CacheHelper.getValue(CacheConstants.userModel);
    if (cachedValue != null && cachedValue is String) {
      userModel = UserModel.fromJson(jsonDecode(cachedValue));
    }
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
                visible: demoTasks.isNotEmpty,
                child: customizedTasksCounter(title: "Tasks", count: 7)
              ),
              Expanded(
                child:
                    demoTasks.isEmpty
                        ? EmptyTasksPrompt()
                        : ListView.builder(
                          itemCount: demoTasks.length,
                          itemBuilder: (context, index) {
                            final task = demoTasks[index];

                            return CustomizedListTaskItem(
                              title: task.title,
                              description: task.description,
                              date: task.date,
                              time: task.time,
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
}
