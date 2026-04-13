import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_nti5/core/customized_widgets/customized_button.dart';
import 'package:todo_nti5/core/customized_widgets/delete_button.dart';
import 'package:todo_nti5/core/resources/app_assets.dart';
import 'package:todo_nti5/core/resources/text_styles.dart';
import 'package:todo_nti5/features/add_and_edit_task/views/widgets/customized_spinner.dart';
import 'package:todo_nti5/features/add_and_edit_task/views/widgets/customized_update_button.dart';

import '../../../../core/customized_widgets/customized_image.dart';
import '../../../../core/customized_widgets/customized_text_field.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../home/data/models/task_model.dart';
import '../widgets/cutomized_date_picker_text_field.dart';
import '../widgets/delete_dialog.dart';

class EditTaskScreen extends StatefulWidget {
  final TaskModel task;

  const EditTaskScreen({super.key, required this.task});

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  String? imagePath;

  @override
  void initState() {
    super.initState();
    _titleController.text = widget.task.title ?? '';
    _descriptionController.text = widget.task.description ?? '';
    _dateController.text = widget.task.createdAt ?? '';
  }

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
          actions: [
            InkWell(
              onTap: () {
                showDeleteDialog(context, () {
                });
              },
              child: DeleteButton(),
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
                          unselectedImageBuilder: Image.asset(AppImages.authImage,
                            height: 207.h,
                            width: 260.w,
                            fit: BoxFit.cover,
                          ),
                          networkImageBuilder: Image.network(widget.task.imagePath??"",
                            height: 207.h,
                            width: 260.w,
                            fit: BoxFit.cover,
                          ),
                          selectedImageBuilder: (String path){
                            imagePath = path;
                            return Image.file(
                              File(path),
                              height: 207.h,
                              width: 260.w,
                              fit: BoxFit.cover,
                            );
                          }
                      ),
                    ),
                CustomizedGroupSpinnerField(),
                CustomizedTextField(
                  hintText: "Title",
                  controller: _titleController,
                ),
                CustomizedTextField(
                  hintText: "Description",
                  isDescription: true,
                  controller: _descriptionController,
                ),
                CustomizedTextField(
                  hintText: "Date",
                  prefixIcon: AppIcons.calendarIcon,
                  readOnly: true,
                  controller: _dateController,
                  onTap: () {
                    setState(() {
                      selectDate(
                        context: context,
                        dateController: _dateController,
                      );
                    });
                  },
                ),
                SizedBox(height: 90.h),
                CustomizedButton(title: "Mark As Done"),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {
                  },
                  child: CustomizedUpdateButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /*void update() async {
    final result = await APIHelper.updateTask(
      taskId: widget.task.id.toString(),
      newTitle: _titleController.text,
      newDescription: _descriptionController.text,
      imagePath: imagePath,
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
              'The Task Updated Successfully',
              style: TextStyle(color: AppColors.white),
            ),
            backgroundColor: AppColors.green,
          ),
        );
        context.pop();
      },
    );
  }
  void delete() async {
    final result = await APIHelper.deleteTask(
      taskId: widget.task.id.toString(),
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
              'The Task Deleted Successfully',
              style: TextStyle(color: AppColors.white),
            ),
            backgroundColor: AppColors.green,
          ),
        );
        context.pop();
      },
    );
  }*/
}
