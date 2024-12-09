import '../../../../core/utils/app_assets.dart';

class OnBoardingModel {
  final String numberOfStep;
  final String image;
  final String textDesc;

  OnBoardingModel({
    required this.numberOfStep,
    required this.image,
    required this.textDesc,
  });
}

List<OnBoardingModel> OnBoardingModels = [
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
