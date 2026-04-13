import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_nti5/core/validator.dart';

import '../../../../core/network/api_helper.dart';
import '../../../../core/resources/app_colors.dart';
import '../../data/models/register_response_model.dart';
import '../widgets/customized_auth_text.dart';
import '../../../../core/customized_widgets/customized_button.dart';
import '../../../../core/customized_widgets/customized_text_field.dart';
import '../../../../core/resources/app_assets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: _formKey,
            child: Column(
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
                  prefixIcon: AppIcons.profileIcon,
                  controller: usernameController,
                  validator: Validators.email,
                ),
                SizedBox(height: 10.h),
                CustomizedTextField(
                  hintText: "Password",
                  prefixIcon: AppIcons.passwordIcon,
                  isPassword: true,
                  controller: passwordController,
                  validator: Validators.password,
                ),
                SizedBox(height: 10.h),
                CustomizedTextField(
                  hintText: "Confirm Password",
                  prefixIcon: AppIcons.passwordIcon,
                  isPassword: true,
                  controller: confirmPasswordController,
                  validator: (value) {
                    return Validators.confirmPassword(
                      value,
                      passwordController.text,
                    );
                  },

                ),
                SizedBox(height: 23.h),
                InkWell(
                    onTap: () {
                      setState(() {

                      });
                    },
                    child: CustomizedButton(title: "Register",)),
                SizedBox(height: 23.h),
                InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: CustomizedAuthText(
                    prompt: "Already have an account?",
                    title: "Login",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

/*
  void register() async {
    if (_formKey.currentState?.validate() == true) {
      var result = await APIHelper.register(
        username: usernameController.text,
        password: passwordController.text,
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
            (RegisterResponse response) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Register successfully',
                style: TextStyle(color: AppColors.white),
              ),
              backgroundColor: AppColors.green,
            ),
          );
          context.pop();
        },
      );
    }
  }
*/
}
