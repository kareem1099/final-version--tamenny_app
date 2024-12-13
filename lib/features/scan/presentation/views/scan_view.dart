import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Lung Disease Analysis'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            Image.asset(Assets.imagesDoctorWelcomeModel),
            const Text(
              'Lung Disease Analysis',
              style: AppStyles.font30SemiBold,
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Upload your chest scan and let Tamenny assist with a trusted analysis.',
              style: AppStyles.font16Regular,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Get started by uploading a clear image of your chest X-ray or CT scan.',
              style: AppStyles.font20SemiBold,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Tamenny’s AI will analyze it and provide results in a few minutes.',
              style: AppStyles.font16Regular,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Pulmonary Scan Analysis utilizes advanced AI technology to assess your lung health.',
              style: AppStyles.font16Regular,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Our AI model can help detect issues such as potential early-stage COPD and assess various lung conditions.',
              style: AppStyles.font16Regular,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'By analyzing your chest scans, we provide a level of confidence in diagnosis and guide you on the next steps.',
              style: AppStyles.font16Regular,
            ),
            const SizedBox(
              height: 60,
            ),
            CustomAppButton(
              text: 'Proceed to Upload',
              onTap: () {
                Navigator.pushNamed(context, Routes.uploadFileView);
              },
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
