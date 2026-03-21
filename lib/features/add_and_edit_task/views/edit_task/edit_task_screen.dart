import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/customized_widgets/customized_button.dart';
import 'package:todo_nti5/core/customized_widgets/customized_spinner.dart';
import 'package:todo_nti5/core/customized_widgets/delete_button.dart';
import 'package:todo_nti5/core/resources/app_assets.dart';
import 'package:todo_nti5/core/resources/text_styles.dart';

import '../../../../core/customized_widgets/customized_text_field.dart';
import '../../../../core/resources/app_colors.dart';


class EditTaskScreen extends StatelessWidget {
  static final String routeName = "/editTask";

  const EditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Edit Task"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
          actions: [DeleteButton()],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            spacing: 10,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.r),
                    child: Image.asset(
                      AppImages.authImage,
                      height: 80.h,
                      width: 80.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Text(
                      "In Progress Believe you can, and you're halfway there.",
                      style: AppTextStyles.bodyMediumText(),
                      maxLines: null,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              CustomizedGroupSpinnerField(),
              CustomizedTextField(hintText: "Title"),
              CustomizedTextField(hintText: "Description", isDescription: true),
              CustomizedTextField(hintText: "Date", prefixIcon: AppIcons.calendarIcon),
              SizedBox(height: 90.h),
              CustomizedButton(title: "Mark As Done"),
              SizedBox(height: 10.h),
              Container(
                height: 50.h,
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.green, width: 2.w),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.green.withOpacity(0.7),
                      offset: Offset(0, 2),
                      spreadRadius: 0,
                      blurRadius: 10.w,
                    )
                  ]
                ),
                child: Text("Update", style: TextStyle(
                  color: AppColors.green,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
