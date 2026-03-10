import 'package:flutter/material.dart';
import 'package:todo_nti5/core/customized_widgets/header_profile.dart';

import '../../core/customized_widgets/customized_setting_card.dart';

class ProfileScreen  extends StatelessWidget {
  static final String routeName = "/profile";
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            HeaderProfile(),
            CustomizedSettingCard(),
          ],
        ),
      ),
    );
  }
}
