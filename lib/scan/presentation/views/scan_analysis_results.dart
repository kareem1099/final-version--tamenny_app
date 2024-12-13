import 'package:flutter/material.dart';

import '../../../core/routes/routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_app_button.dart';

class ScanAnalysisResults extends StatelessWidget {
  const ScanAnalysisResults({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Scan Analysis Results'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Image.asset(Assets.imagesScanResult),
            SizedBox(
              height: 20,
            ),
            Text('Diagnosis Summary', style: AppStyles.font20SemiBold),
            SizedBox(
              height: 8,
            ),
            Text(
              'Diagnosed Condition: Potential Early-Stage Chronic Obstructive Pulmonary Disease (COPD)',
              style: AppStyles.font16Regular,
            ),
            SizedBox(
              height: 20,
            ),
            Text('Confidence Level', style: AppStyles.font20SemiBold),
            SizedBox(
              height: 8,
            ),
            Text(
              'The AI analysis provides a confidence level of 98%, indicating strong reliability in the results.',
              style: AppStyles.font16Regular,
            ),
            SizedBox(
              height: 20,
            ),
            Text('Recommended Next Steps', style: AppStyles.font20SemiBold),
            SizedBox(
              height: 8,
            ),
            Text(
              'Consulting with a pulmonologist is advised for a thorough evaluation and personalized treatment strategies.',
              style: AppStyles.font16Regular,
            ),
            SizedBox(
              height: 20,
            ),
            Text('Empower Your Health', style: AppStyles.font20SemiBold),
            SizedBox(
              height: 8,
            ),
            Text(
              'We encourage you to share these results with trusted healthcare professionals and specialists. This collaborative approach enhances your understanding and supports informed decisions regarding your health.',
              style: AppStyles.font16Regular,
            ),
            SizedBox(
              height: 40,
            ),
            CustomAppButton(
              text: 'Share Results with Healthcare Professionals',
              onTap: () {
                Navigator.pushNamed(context, Routes.processingScreen);
              },
            ),
            SizedBox(
              height: 12,
            ),
            CustomAppButton(
              text: 'Upload Another Scan',
              bgColor: Color(0xffEFF1F5),
              textColor: Colors.black,
              onTap: () {
                Navigator.pushNamed(context, Routes.processingScreen);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text('Next Steps', style: AppStyles.font20SemiBold),
            SizedBox(
              height: 8,
            ),
            Text(
              'Please consult a pulmonologist for further evaluation and treatment recommendations.',
              style: AppStyles.font16Regular,
            ),
            SizedBox(
              height: 20,
            ),
            Text('Your Feedback Matters', style: AppStyles.font20SemiBold),
            SizedBox(
              height: 8,
            ),
            Text(
              'Help us improve by rating your experience.',
              style: AppStyles.font16Regular,
            ),
            SizedBox(
              height: 10,
            ),
            FeedBackReviewsWidget(),
            SizedBox(
              height: 20,
            ),
            Text('Need Help?', style: AppStyles.font20SemiBold),
            SizedBox(
              height: 8,
            ),
            Text(
              'Visit our FAQ or contact support for assistance.',
              style: AppStyles.font16Regular,
            ),
            SizedBox(
              height: 8,
            ),
            CustomAppButton(
              text: 'Visit FAQ',
              bgColor: Color(0xffEFF1F5),
              textColor: Colors.black,
              onTap: () {
                Navigator.pushNamed(context, Routes.processingScreen);
              },
            ),
            SizedBox(
              height: 12,
            ),
            CustomAppButton(
              text: 'Contact Support',
              bgColor: Color(0xffEFF1F5),
              textColor: Colors.black,
              onTap: () {
                Navigator.pushNamed(context, Routes.processingScreen);
              },
            ),
            SizedBox(
              height: 8,
            ),
            SizedBox(
              height: 20,
            ),
            Text('Share Your Results!', style: AppStyles.font20SemiBold),
            SizedBox(
              height: 8,
            ),
            Text(
              'Share your AI results in our community for expert reviews and advice.',
              style: AppStyles.font16Regular,
            ),
            SizedBox(
              height: 16,
            ),
            CustomAppButton(
              text: 'Share in Community',
              onTap: () {
                Navigator.pushNamed(context, Routes.processingScreen);
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class FeedBackReviewsWidget extends StatelessWidget {
  const FeedBackReviewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(onTap: () {}, child: Icon(Icons.star_border)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('4.95', style: AppStyles.font16SemiBold),
        ),
        Text(
          '22 reviews',
          style: AppStyles.font16Regular.copyWith(color: Color(0xffA09CAB)),
        ),
      ],
    );
  }
}
