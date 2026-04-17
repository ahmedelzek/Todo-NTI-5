import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_nti5/core/customized_widgets/customized_button.dart';
import 'package:todo_nti5/core/resources/app_assets.dart';
import 'package:todo_nti5/features/add_and_edit_task/cubit/add_task/add_task_cubit.dart';
import '../../../../core/customized_widgets/customized_image.dart';
import '../../../../core/customized_widgets/customized_text_field.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/validator.dart';
import '../../cubit/add_task/add_task_state.dart';
import '../widgets/customized_spinner.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Task"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context, true);
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocConsumer<AddTaskCubit, AddTaskState>(
              listener: (context, state) {
                if (state is AddTaskErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.error,
                        style: TextStyle(color: AppColors.white),
                      ),
                      backgroundColor: AppColors.red,
                    ),
                  );
                } else if (state is AddTaskSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.success,
                        style: TextStyle(color: AppColors.white),
                      ),
                      backgroundColor: AppColors.green,
                    ),
                  );
                  context.pop();
                }
              },
              builder: (context, state) {
                var cubit = AddTaskCubit.get(context);
                return Form(
                  key: cubit.formKey,
                  child:
                  Column(
                    children: [
                      SizedBox(height: 40.h),
                      Center(
                        child: ImageManager(
                          unselectedImageBuilder: Icon(
                            Icons.image,
                            size: 200.r,
                          ),
                          onImageSelected: (path) => cubit.imagePath = path,
                          selectedImageBuilder: (String imagePath) {
                            return SizedBox(
                              height: 200.h,
                              width: 200.w,
                              child: Image.file(
                                File(imagePath),
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 23.h),
                      CustomizedTextField(
                        hintText: "Title",
                        controller: cubit.title,
                        validator: Validators.requiredField,
                      ),
                      SizedBox(height: 10.h),
                      CustomizedTextField(
                        hintText: "Description",
                        isDescription: true,
                        controller: cubit.description,
                      ),
                      SizedBox(height: 10.h),
                      CustomizedGroupSpinnerField(),
                      SizedBox(height: 10.h),
                      CustomizedTextField(
                        hintText: "Date",
                        prefixIcon: AppIcons.calendarIcon,
                        readOnly: true,
                      ),
                      SizedBox(height: 10.h),
                      CustomizedButton(
                        title: "Add Task",
                        clickAble: state is! AddTaskLoadingState,
                        onTap: () async {
                         await cubit.addTask();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
