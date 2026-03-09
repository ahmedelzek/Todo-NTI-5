import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/resources/text_styles.dart';

class CustomizedAuthText extends StatelessWidget {
  final String prompt;

  final String title;

  const CustomizedAuthText({
    super.key,
    required this.prompt,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(prompt, style: AppTextStyles.bodyMediumLightText()),
        SizedBox(width: 15.w),
        Text(title, style: AppTextStyles.bodyMediumBoldText()),
      ],
    );
  }
}
