import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class NotificationState extends StatelessWidget {
  const NotificationState({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Today',
          style: AppStyles.font12Medium.copyWith(
            color: const Color(0xff9E9E9E),
          ),
        ),
        Text(
          'Mark all as read',
          style:
              AppStyles.font12Regular.copyWith(color: AppColors.primaryColor),
        )
      ],
    );
  }
}
