import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_nti5/core/customized_widgets/customized_button.dart';
import 'package:todo_nti5/core/customized_widgets/delete_button.dart';
import 'package:todo_nti5/core/resources/app_assets.dart';
import 'package:todo_nti5/features/add_and_edit_task/cubit/edit_task/edit_task_cubit.dart';
import 'package:todo_nti5/features/add_and_edit_task/cubit/edit_task/edit_task_state.dart';

import '../../../../core/customized_widgets/customized_image.dart';
import '../../../../core/customized_widgets/customized_text_field.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../home/data/models/task_model.dart';
import '../widgets/delete_dialog.dart';

class EditTaskScreen extends StatelessWidget {
  final TaskModel task;

  const EditTaskScreen({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => EditTaskCubit(),
        child: BlocConsumer<EditTaskCubit, EditTaskState>(
          listener: (context, state) {
            if (state is EditTaskErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.error,
                    style: TextStyle(color: AppColors.white),
                  ),
                  backgroundColor: AppColors.red,
                ),
              );
            } else if (state is EditTaskSuccessState) {
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
            var cubit = EditTaskCubit.get(context);
            cubit.titleController.text = task.title??"";
            cubit.descriptionController.text = task.description??"";
            return Scaffold(
              appBar: AppBar(
                title: Text("Edit Task"),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    context.pop();
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                actions: [
                  DeleteButton(
                    onTap: () {
                      showDeleteDialog(context, () {
                        cubit.delete(task.id.toString());
                      });
                    },
                    clickAble: state is! EditTaskLoadingState,
                  ),
                ],
              ),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 10,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: ImageManager(
                          unselectedImageBuilder: Image.asset(
                            AppImages.authImage,
                            height: 207.h,
                            width: 260.w,
                            fit: BoxFit.cover,
                          ),
                          networkImageBuilder: Image.network(
                            task.imagePath ?? "",
                            height: 207.h,
                            width: 260.w,
                            fit: BoxFit.cover,
                          ),
                          selectedImageBuilder: (String path) {
                            return Image.file(
                              File(path),
                              height: 207.h,
                              width: 260.w,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                      CustomizedTextField(
                        hintText: "Title",
                        controller: cubit.titleController,
                      ),
                      CustomizedTextField(
                        hintText: "Description",
                        isDescription: true,
                        controller: cubit.descriptionController,
                      ),
                      CustomizedTextField(
                        hintText: "Date",
                        prefixIcon: AppIcons.calendarIcon,
                        readOnly: true,
                        onTap: () {},
                      ),
                      SizedBox(height: 90.h),
                      CustomizedButton(
                        title: "Update",
                        onTap: () => cubit.update(task.id.toString()),
                        clickAble: state is! EditTaskLoadingState,
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
