import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../data/models/on_boarding_model.dart';

class OnBoardingPageViewBody extends StatefulWidget {
  const OnBoardingPageViewBody(
      {super.key, required this.controller, required this.onBoardingModel});
  final PageController controller;
  final OnBoardingModel onBoardingModel;

  @override
  State<OnBoardingPageViewBody> createState() => _OnBoardingPageViewBodyState();
}

class _OnBoardingPageViewBodyState extends State<OnBoardingPageViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(500),
              border: Border.all(color: AppColors.primaryColor),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
              child: Text(
                widget.onBoardingModel.numberOfStep,
                style: AppStyles.font16Bold.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 400,
          width: 400,
          child: Image.asset(
            widget.onBoardingModel.image,
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        SmoothPageIndicator(
          controller: widget.controller,
          count: 3,
          axisDirection: Axis.horizontal,
          effect: WormEffect(
            dotColor: AppColors.primaryColor.withOpacity(0.25),
            activeDotColor: AppColors.primaryColor,
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Text(
            widget.onBoardingModel.textDesc,
            textAlign: TextAlign.center,
            style: AppStyles.font30ExtraBold.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
