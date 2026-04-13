import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_nti5/core/customized_widgets/header_profile.dart';

import '../../../core/app_router/app_router_keys.dart';
import 'widgets/customized_setting_card.dart';
import '../../../core/resources/app_assets.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              HeaderProfile(userName: "Ahmad"),
              InkWell(
                onTap: () {
                  context.push(AppRouterKeys.updateProfile);
                },
                child: CustomizedSettingCard(
                  title: "Profile",
                  icon: AppIcons.profileIcon,
                ),
              ),
              InkWell(
                onTap: () {
                  context.push(AppRouterKeys.changePassword);
                },
                child: CustomizedSettingCard(
                  title: "Change Password",
                  icon: AppIcons.passwordIcon,
                ),
              ),
              InkWell(
                onTap: () {
                  context.push(AppRouterKeys.settings);
                },
                child: CustomizedSettingCard(
                  title: "Settings",
                  icon: AppIcons.settingIcon,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
