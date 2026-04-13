import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_nti5/core/app_router/app_router_keys.dart';
import 'package:todo_nti5/core/customized_widgets/customized_button.dart';
import 'package:todo_nti5/core/customized_widgets/customized_text_field.dart';
import 'package:todo_nti5/core/validator.dart';
import 'package:todo_nti5/features/auth/cubit/login/login_cubit.dart';
import 'package:todo_nti5/features/auth/cubit/login/login_state.dart';

import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_colors.dart';
import '../widgets/customized_auth_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error,
                  style: TextStyle(color: AppColors.white),
                ),
                backgroundColor: AppColors.red,
              ),
            );
          } else if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Login successfully\n Welcome ${state.userModel.username}',
                  style: TextStyle(color: AppColors.white),
                ),
                backgroundColor: AppColors.green,
              ),
            );
            context.go(AppRouterKeys.home);
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Form(
                  key: cubit.formKey,
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
                        controller: cubit.emailController,
                        hintText: "Username",
                        validator: Validators.email,
                        prefixIcon: AppIcons.profileIcon,
                      ),
                      SizedBox(height: 10.h),
                      CustomizedTextField(
                        controller: cubit.passwordController,
                        validator: Validators.password,
                        hintText: "Password",
                        prefixIcon: AppIcons.passwordIcon,
                        isPassword: true,
                      ),
                      SizedBox(height: 23.h),
                      CustomizedButton(
                        title: "Login",
                        onTap: () async {
                          cubit.login();
                        },
                        clickAble: state is! LoginLoading,
                      ),
                      SizedBox(height: 23.h),
                      InkWell(
                        onTap: () {
                          context.push(AppRouterKeys.register);
                        },
                        child: CustomizedAuthText(
                          prompt: "Don't have account?",
                          title: "Register",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
