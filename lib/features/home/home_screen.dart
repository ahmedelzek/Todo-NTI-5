import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderProfile(),
              SizedBox(height: 20.h),
              CustomizedHomeTasksCard(),
              SizedBox(height: 20.h),
              SizedBox(
                height: 110.h,
                child: ListView.builder(
                  itemCount: demoTasks.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: CustomizedTaskItem(
                        taskModel: demoTasks[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
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
