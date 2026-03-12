import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_nti5/core/customized_widgets/customized_list_task_item.dart';
import 'package:todo_nti5/core/customized_widgets/customized_tasks_counter.dart';
import 'package:todo_nti5/core/customized_widgets/empty_tasks_prompt.dart';
import 'package:todo_nti5/core/customized_widgets/header_profile.dart';
import 'package:todo_nti5/core/resources/app_assets.dart';
import 'package:todo_nti5/core/resources/text_styles.dart';

import '../../../core/demo_data/demo_tasks_data.dart';
import '../../../core/resources/app_colors.dart';
import '../../add_task/add_task_screen.dart';

class TasksByTypeScreen extends StatelessWidget {
  static final String routeName = "/home";

  const TasksByTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HeaderProfile(),
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
    );
  }
}
