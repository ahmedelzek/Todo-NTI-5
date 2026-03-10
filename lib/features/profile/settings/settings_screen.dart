import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/customized_widgets/customized_toggle.dart';
import '../../../core/resources/text_styles.dart';

class SettingsScreen extends StatelessWidget {
  static final String routeName = "/settings";
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 50.h, horizontal: 20.w),
        child: Row(
          children: [
            Text("Language", style: AppTextStyles.smallTitleText()),
            Spacer(),
            LanguageSwitch()
          ],
        ),
      ),
    );
  }
}
