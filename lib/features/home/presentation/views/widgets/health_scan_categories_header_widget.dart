import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class HealthScanCategoriesHeaderWidget extends StatelessWidget {
  const HealthScanCategoriesHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Health Scan Categories',
          style: AppStyles.font18SemiBold,
        ),
        GestureDetector(
          onTap: () {
            log('Navigating to: ${Routes.healthScanCategoriesView}');
            Navigator.of(context, rootNavigator: true)
                .pushNamed(Routes.healthScanCategoriesView);
          },
          child: Text(
            'See All',
            style: AppStyles.font12Regular.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
