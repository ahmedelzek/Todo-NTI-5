import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_nti5/core/resources/text_styles.dart';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';

class CustomizedTextField extends StatefulWidget {
  final String? hintText;
  final String? prefixIcon;
  final bool isPassword;
  final bool isDescription;
  final bool readOnly;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Function()? onTap;



  const CustomizedTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.controller,
    this.validator,
    this.onTap ,
    this.isPassword = false,
    this.isDescription = false,
    this.readOnly = false,
  });

  @override
  State<CustomizedTextField> createState() => _CustomizedTextFieldState();
}

class _CustomizedTextFieldState extends State<CustomizedTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: widget.isDescription ? 8.h : 20.h,
      ),
      width: double.infinity,
      height: widget.isDescription ? null : 63.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.white,
        border: Border.all(color: AppColors.lightGrey, width: 2.w),
      ),
      child: TextFormField(
        obscureText: _obscureText,
        controller: widget.controller,
        validator: widget.validator,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        minLines: 1,
        maxLines: widget.isDescription ? null : 1,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
          prefixIcon:
              widget.prefixIcon != null
                  ? SvgPicture.asset(
                    widget.prefixIcon!,
                    width: 24.w,
                    height: 24.h,
                  )
                  : null,
          suffixIcon:
              widget.isPassword
                  ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: SvgPicture.asset(
                      _obscureText ? AppIcons.lockIcon : AppIcons.unlockIcon,
                      width: 24.w,
                      height: 24.h,
                    ),
                  )
                  : null,
          hintText: widget.hintText,
        ),
        style: AppTextStyles.bodyMediumText(),
      ),
    );
  }
}
