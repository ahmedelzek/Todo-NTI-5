import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/customized_widgets/header_profile.dart';
import 'package:todo_nti5/features/profile/settings/settings_screen.dart';
import 'package:todo_nti5/features/profile/update_profile/update_profile_screen.dart';

import '../../core/customized_widgets/customized_setting_card.dart';
import '../../core/resources/app_assets.dart';
import 'chande_password/change_password_screen.dart';

class ProfileScreen extends StatelessWidget {
  static final String routeName = "/profile";

  const ProfileScreen({super.key});

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
                  Navigator.pushNamed(context, UpdateProfileScreen.routeName);
                },
                child: CustomizedSettingCard(
                  title: "Profile",
                  icon: AppIcons.profileIcon,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ChangePasswordScreen.routeName);
                },
                child: CustomizedSettingCard(
                  title: "Change Password",
                  icon: AppIcons.passwordIcon,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, SettingsScreen.routeName);
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
