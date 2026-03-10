import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/customized_widgets/customized_text_field.dart';
import '../../../core/resources/app_assets.dart';

class UpdateProfileScreen extends StatelessWidget {
  static final String routeName = "/updateProfile";
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20.r),
            child: Image.asset(
              AppImages.authImage,
              width: 375.w,
              height: 298.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 23.h),
          CustomizedTextField(
            hintText: "Username",
          )
        ],
      ),
    );
  }
}
