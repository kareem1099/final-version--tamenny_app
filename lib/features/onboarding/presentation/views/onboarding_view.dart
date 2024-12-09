import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/features/onboarding/data/models/on_boarding_model.dart';

import 'widgets/on_boarding_button_section.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController controller = PageController();
  int current_page_index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  current_page_index = index;
                });
              },
              controller: controller,
              itemBuilder: (context, index) {
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
                            OnBoardingModels[index].numberOfStep,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      width: 400,
                      child: Image.asset(
                        OnBoardingModels[index].image,
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SmoothPageIndicator(
                      controller: controller,
                      count: 3,
                      axisDirection: Axis.horizontal,
                      effect: WormEffect(
                          dotColor: AppColors.primaryColor.withOpacity(0.25),
                          activeDotColor: AppColors.primaryColor),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        OnBoardingModels[index].textDesc,
                        textAlign: TextAlign.center,
                        style: AppStyles.font30ExtraBold
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                );
              },
              itemCount: OnBoardingModels.length,
            ),
            BottonSection(
              controller: controller,
              currentPage: current_page_index,
            ),
          ],
        ),
      ),
    );
  }
}
