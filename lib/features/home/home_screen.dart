import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_nti5/core/customized_widgets/customized_tasks_counter.dart';
import 'package:todo_nti5/core/customized_widgets/empty_tasks_prompt.dart';
import 'package:todo_nti5/core/resources/text_styles.dart';

import '../../core/customized_widgets/customized_gourps_card.dart';
import '../../core/customized_widgets/customized_home_tasks_card.dart';
import '../../core/customized_widgets/customized_task_item.dart';
import '../../core/customized_widgets/header_profile.dart';
import '../../core/demo_data/demo_tasks_data.dart';
import '../../core/resources/app_assets.dart';
import '../../core/resources/app_colors.dart';
import '../add_task/add_task_screen.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = "/updatedHome";

  const HomeScreen({super.key});
  bool get hasTasks => demoTasks.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: hasTasks ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20.h,
            children: [
              HeaderProfile(),
              CustomizedHomeTasksCard(),
              customizedTasksCounter(title: "In Progress", count: 5),
              SizedBox(
                height: 110.h,
                child: ListView.builder(
                  itemCount: demoTasks.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: CustomizedTaskItem(taskModel: demoTasks[index]),
                    );
                  },
                ),
              ),
              Text("Tasks Group", style: AppTextStyles.bodyMediumText()),
              CustomizedGroupsCard(title: "Home Tasks", count: 5),
              CustomizedGroupsCard(
                title: "Personal Tasks",
                count: 5,
                icon: AppIcons.personalIcon,
                color: AppColors.green,
                backgroundColor: AppColors.transparentGreen,
              ),
              CustomizedGroupsCard(
                title: "Work Tasks",
                count: 5,
                icon: AppIcons.workIcon,
                color: AppColors.white,
                backgroundColor: AppColors.black,
              ),
            ],
          ): Column(
            children: [
              HeaderProfile(),
              Expanded(child: EmptyTasksPrompt())
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, AddTaskScreen.routeName);
          },
          backgroundColor: AppColors.green,
          child: SvgPicture.asset(
            AppIcons.addIcon,
            width: 24.w,
            height: 24.h,
            colorFilter: ColorFilter.mode(
              AppColors.transparentGreen,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
