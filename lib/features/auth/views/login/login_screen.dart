import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/cache/cache_helper.dart';
import 'package:todo_nti5/core/customized_widgets/customized_button.dart';
import 'package:todo_nti5/core/customized_widgets/customized_text_field.dart';
import 'package:todo_nti5/features/auth/views/widgets/validator.dart';

import '../../../../core/cache/cache_constants.dart';
import '../widgets/customized_auth_text.dart';
import '../../../../core/network/api_helper.dart';
import '../../../../core/resources/app_assets.dart';
import '../../../../core/resources/app_colors.dart';
import '../../../home/home_screen.dart';
import '../../data/models/user_model.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static final String routeName = "/login";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  bool isLoading = false;

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
                  controller:emailController,
                  hintText: "Username",
                  validator: Validators.email,
                  prefixIcon: AppIcons.profileIcon,
                ),
                SizedBox(height: 10.h),
                CustomizedTextField(
                  controller:passwordController,
                  validator: Validators.password,
                  hintText: "Password",
                  prefixIcon: AppIcons.passwordIcon,
                  isPassword: true,
                ),
                SizedBox(height: 23.h),
                InkWell(
                  onTap: () {
                    login();
                  },
                  child: CustomizedButton(title: "Login"),
                ),
                SizedBox(height: 23.h),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RegisterScreen.routeName);
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
  }

  void login() async{
    if(_formKey.currentState?.validate() == true){
      setState(() {
        isLoading = true;
      });
      var result = await APIHelper.login(username: emailController.text, password: passwordController.text);
      result.fold(
              (String error){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(error, style: TextStyle(color: AppColors.white),),
              backgroundColor: AppColors.red,
            ));
          },
              (UserModel userModel){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Login successfully\n Welcome ${userModel.username}', style: TextStyle(color: AppColors.white),),
              backgroundColor: AppColors.green,
            ));
            Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (context)=> HomeScreen()),
                    (r)=> false
            );
            CacheHelper.setValue(CacheConstants.userModel, userModel);
          }
      );
      setState(() {
        isLoading = false;
      });
    }
  }
}

