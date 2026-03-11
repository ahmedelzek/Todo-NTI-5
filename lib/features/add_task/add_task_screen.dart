import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/customized_widgets/customized_button.dart';
import 'package:todo_nti5/core/resources/app_assets.dart';

import '../../core/customized_widgets/customized_spinner.dart';
import '../../core/customized_widgets/customized_text_field.dart';

class AddTaskScreen extends StatelessWidget {
  static final String routeName = "/addTask";

  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Task"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40.h),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: Image.asset(AppImages.authImage, fit: BoxFit.cover,
                    width: 261.w,
                    height: 207.h),
              ),
            ),
            SizedBox(height: 23.h),
            CustomizedTextField(hintText: "Title",),
            SizedBox(height: 10.h),
            CustomizedTextField(hintText: "Description", isDescription: true,),
            SizedBox(height: 10.h),
            CustomizedGroupSpinnerField(),
            SizedBox(height: 10.h),
            CustomizedTextField(hintText: "Date", prefixIcon: AppIcons.calendarIcon),
            SizedBox(height: 10.h),
            CustomizedButton(title: "Add Task")
          ],
        ),
      ),
    );
  }
}
