import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/text_styles.dart';

class CustomizedGroupSpinnerField extends StatefulWidget {
  const CustomizedGroupSpinnerField({super.key});

  @override
  State<CustomizedGroupSpinnerField> createState() =>
      _CustomizedGroupSpinnerFieldState();
}

class _CustomizedGroupSpinnerFieldState
    extends State<CustomizedGroupSpinnerField> {

  Map<String, dynamic>? selectedItem;

  final List<Map<String, dynamic>> items = [
    {
      "text": "Home",
      "icon": AppIcons.homeIcon,
      "color": AppColors.transparentPink
    },
    {
      "text": "Personal",
      "icon": AppIcons.personalIcon,
      "color": AppColors.green
    },
    {
      "text": "Work",
      "icon": AppIcons.workIcon,
      "color": AppColors.black
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 63.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.white,
        border: Border.all(color: AppColors.lightGrey, width: 2.w),
      ),

      child: DropdownButtonHideUnderline(
        child: DropdownButton<Map<String, dynamic>>(
          dropdownColor: AppColors.white,
          isExpanded: true,
          borderRadius: BorderRadius.circular(20.r),
          value: selectedItem,
          hint: Text(
            "Group",
            style: AppTextStyles.bodyMediumLightText(),
          ),
          items: items
              .map<DropdownMenuItem<Map<String, dynamic>>>(
                  (Map<String, dynamic> item) {

                final Color color = item["color"];

                return DropdownMenuItem<Map<String, dynamic>>(
                  value: item,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: SvgPicture.asset(
                          item["icon"],
                          width: 18.w,
                          height: 18.h,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(item["text"], style: AppTextStyles.bodyMediumText()),
                    ],
                  ),
                );
              }).toList(),
          onChanged: (value) {
            setState(() {
              selectedItem = value;
            });
          },
        ),
      ),
    );
  }
}