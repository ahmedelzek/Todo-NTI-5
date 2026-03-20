import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_nti5/core/resources/app_theme.dart';
import 'core/cache/cache_helper.dart';
import 'features/splash/splash_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375,812),
      child: MaterialApp(
        title: 'Todo',
        theme: AppTheme.lightTheme,
        home: SplashScreen(),
      ),
    );
  }
}
