import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/customized_widgets/customized_image.dart';
import 'package:todo_nti5/core/resources/text_styles.dart';

class HeaderProfile extends StatefulWidget {
  final String? userName;
  final String? imagePath;

  const HeaderProfile({super.key, required this.userName, this.imagePath});

  @override
  State<HeaderProfile> createState() => _HeaderProfileState();
}

class _HeaderProfileState extends State<HeaderProfile> {
  String? imagePath;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        children: [
          ClipOval(
            child: ImageManager(
              unselectedImageBuilder: Icon(Icons.image, size: 50.r),
              clickAble: false,
            ),
          ),
          SizedBox(width: 16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello!", style: AppTextStyles.bodySmallLightText()),
              Text("${widget.userName}", style: AppTextStyles.bodyMediumText()),
            ],
          ),
        ],
      ),
    );
  }
}
