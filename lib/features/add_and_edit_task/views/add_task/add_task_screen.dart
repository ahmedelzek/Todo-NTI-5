import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_nti5/core/customized_widgets/customized_button.dart';
import 'package:todo_nti5/core/network/api_helper.dart';
import 'package:todo_nti5/core/resources/app_assets.dart';
import 'package:todo_nti5/features/add_and_edit_task/views/widgets/cutomized_date_picker_text_field.dart';

import '../../../../core/customized_widgets/customized_spinner.dart';
import '../../../../core/customized_widgets/customized_text_field.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../auth/views/widgets/validator.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 40.h),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.r),
                    child: Image.asset(
                      AppImages.authImage,
                      fit: BoxFit.cover,
                      width: 261.w,
                      height: 207.h,
                    ),
                  ),
                ),
                SizedBox(height: 23.h),
                CustomizedTextField(
                  hintText: "Title",
                  controller: _titleController,
                  validator: Validators.requiredField,
                ),
                SizedBox(height: 10.h),
                CustomizedTextField(
                  hintText: "Description",
                  isDescription: true,
                  controller: _descriptionController,
                ),
                SizedBox(height: 10.h),
                CustomizedGroupSpinnerField(),
                SizedBox(height: 10.h),
                CustomizedDatePickerTextField(),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                    add();
                  },
                  child: CustomizedButton(title: "Add Task"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> add() async {
    if (_formKey.currentState?.validate() == true) {
      var result = await APIHelper.addTask(
        title: _titleController.text,
        description: _descriptionController.text,
      );
      result.fold(
            (String error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(error, style: TextStyle(color: AppColors.white)),
              backgroundColor: AppColors.red,
            ),
          );
        },
            (String success) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'The Task Added Successfully',
                style: TextStyle(color: AppColors.white),
              ),
              backgroundColor: AppColors.green,
            ),
          );
          context.pop();
        },
      );
    }
  }
}
