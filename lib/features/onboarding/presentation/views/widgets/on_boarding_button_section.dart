import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tamenny_app/features/onboarding/presentation/views/widgets/on_boarding_custom_button.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class BottonSection extends StatelessWidget {
  const BottonSection({
    super.key,
    required this.controller,
    required this.currentPage,
  });
  final PageController controller;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomOnboardingButton(
            controller: controller,
            currentPage: currentPage,
          ),
          SizedBox(
            height: 46,
          ),
        ],
      ),
    );
  }
}
