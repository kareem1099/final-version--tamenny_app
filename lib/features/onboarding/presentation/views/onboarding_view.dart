import 'package:flutter/material.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/features/onboarding/data/models/on_boarding_model.dart';
import 'widgets/on_boarding_button_section.dart';
import 'widgets/on_boarding_page_view_body.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController controller = PageController();
  final List<OnBoardingModel> onBoardingModels = const [
    OnBoardingModel(
      numberOfStep: 'Step One',
      image: Assets.imagesOnboarding2,
      textDesc: 'Accurate Health Insights, Just For You',
    ),
    OnBoardingModel(
      numberOfStep: 'Step Two',
      image: Assets.imagesOnboarding3,
      textDesc: 'AI-Driven Results, Personalized Care',
    ),
    OnBoardingModel(
      numberOfStep: 'Step Three',
      image: Assets.imagesOnboarding4,
      textDesc: 'Connect, Share, And Grow Together.',
    ),
  ];

  int current_page_index = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              onPageChanged: (index) {
                setState(
                  () {
                    current_page_index = index;
                  },
                );
              },
              controller: controller,
              itemBuilder: (context, index) {
                return onBoardingPageViewBody(
                  controller: controller,
                  onBoardingModel: onBoardingModels[index],
                );
              },
              itemCount: onBoardingModels.length,
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

