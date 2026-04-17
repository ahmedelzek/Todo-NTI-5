import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_nti5/core/app_router/app_router_keys.dart';
import 'package:todo_nti5/core/validator.dart';
import 'package:todo_nti5/features/auth/cubit/register/register_cubit.dart';
import 'package:todo_nti5/features/auth/cubit/register/register_state.dart';

import '../../../../core/customized_widgets/customized_button.dart';
import '../../../../core/customized_widgets/customized_image.dart';
import '../../../../core/customized_widgets/customized_text_field.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_colors.dart';
import '../widgets/customized_auth_text.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocConsumer<RegisterCubit, RegisterState>(
              listener: (context, state) {
                if (state is RegisterErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.errorMsg,
                        style: TextStyle(color: AppColors.white),
                      ),
                      backgroundColor: AppColors.red,
                    ),
                  );
                } else if (state is RegisterSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Register successfully',
                        style: TextStyle(color: AppColors.white),
                      ),
                      backgroundColor: AppColors.green,
                    ),
                  );
                  context.go(AppRouterKeys.login);
                }
              },
              builder: (context, state) {
                var cubit = RegisterCubit.get(context);
                return Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      ImageManager(
                          unselectedImageBuilder: Icon(Icons.image, size: 50,),
                          onImageSelected: (path)=> cubit.imagePath = path,
                          selectedImageBuilder: (String imagePath){
                            return SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.file(File(imagePath), fit: BoxFit.contain,)
                            );
                          }
                      ),
                      SizedBox(height: 23.h),
                      CustomizedTextField(
                        hintText: "Username",
                        prefixIcon: AppIcons.profileIcon,
                        controller: cubit.usernameController,
                        validator: Validators.email,
                      ),
                      SizedBox(height: 10.h),
                      CustomizedTextField(
                        hintText: "Password",
                        prefixIcon: AppIcons.passwordIcon,
                        isPassword: true,
                        controller: cubit.passwordController,
                        validator: Validators.password,
                      ),
                      SizedBox(height: 10.h),
                      CustomizedTextField(
                        hintText: "Confirm Password",
                        prefixIcon: AppIcons.passwordIcon,
                        isPassword: true,
                        controller: cubit.confirmPasswordController,
                        validator: (value) {
                          return Validators.confirmPassword(
                            value,
                            cubit.passwordController.text,
                          );
                        },
                      ),
                      SizedBox(height: 23.h),
                      CustomizedButton(
                        title: "Register",
                        clickAble: state is! RegisterLoadingState,
                        onTap: () async {
                            cubit.register();
                          }
                      ),
                      SizedBox(height: 23.h),
                      CustomizedAuthText(
                        prompt: "Already have an account?",
                        title: "Login",
                        onTap: context.pop,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
