import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_nti5/core/customized_widgets/customized_list_task_item.dart';
import 'package:todo_nti5/core/customized_widgets/empty_tasks_prompt.dart';
import 'package:todo_nti5/core/customized_widgets/header_profile.dart';
import 'package:todo_nti5/core/resources/app_assets.dart';

import '../../core/resources/app_colors.dart';

class HomeScreen extends StatelessWidget {
  static final String routeName = "/home";

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HeaderProfile(),
            Expanded(child: EmptyTasksPrompt()),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
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
