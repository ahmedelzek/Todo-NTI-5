import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/resources/text_styles.dart';

class CustomizedAuthText extends StatelessWidget {
  final String prompt;
  final String title;
  final VoidCallback? onTap;

  const CustomizedAuthText({
    super.key,
    required this.prompt,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(prompt, style: AppTextStyles.bodyMediumLightText()),
          SizedBox(width: 15.w),
          Text(title, style: AppTextStyles.bodyMediumBoldText()),
        ],
      ),
    );
  }
}
