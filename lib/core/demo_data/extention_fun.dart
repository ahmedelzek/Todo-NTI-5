import 'dart:ui';

import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import 'demo_tasks_data.dart';

extension TaskTypeExtension on TaskType {
  Color get backgroundColor {
    switch (this) {
      case TaskType.work:
        return AppColors.black;

      case TaskType.home:
        return AppColors.transparentPink;

      case TaskType.personal:
        return AppColors.transparentGreen;
    }
  }

  String get icon {
    switch (this) {
      case TaskType.work:
        return AppIcons.workIcon;

      case TaskType.home:
        return AppIcons.homeIcon;

      case TaskType.personal:
        return AppIcons.personalIcon;
    }
  }

  Color get iconBackground {
    switch (this) {
      case TaskType.work:
        return AppColors.green;

      case TaskType.home:
        return AppColors.transparentPink;

      case TaskType.personal:
        return AppColors.green;
    }
  }
  Color get textColor {
    switch (this) {
      case TaskType.work:
        return AppColors.white;

      case TaskType.home:
        return AppColors.black;

      case TaskType.personal:
        return AppColors.black;
    }
  }
}