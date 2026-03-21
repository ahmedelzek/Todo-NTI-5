import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_nti5/core/resources/text_styles.dart';

import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_colors.dart';

class CustomizedDatePickerTextField extends StatefulWidget {
  const CustomizedDatePickerTextField({super.key});

  @override
  State<CustomizedDatePickerTextField> createState() =>
      _CustomizedDatePickerTextFieldState();
}

class _CustomizedDatePickerTextFieldState
    extends State<CustomizedDatePickerTextField> {
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      width: double.infinity,
      height: 63.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.white,
        border: Border.all(color: AppColors.lightGrey, width: 2.w),
      ),
      child: TextFormField(
        controller: _dateController,
        readOnly: true,
        onTap: () => _selectDate(context),
        decoration: InputDecoration(
          prefixIcon: SvgPicture.asset(
            AppIcons.calendarIcon,
            width: 18.w,
            height: 18.h,
          ),
          hintText: "End Date",
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.grey,
            fontWeight: FontWeight.w400,
          )
        ),
        style: AppTextStyles.bodyMediumText(),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _dateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }
}
