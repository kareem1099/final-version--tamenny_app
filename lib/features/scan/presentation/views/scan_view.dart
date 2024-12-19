import 'package:flutter/material.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';

import 'functions/build_benefits_sections.dart';
import 'functions/build_step_indicator.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Lung Disease Analysis'),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesDoctorWelcomeModel, height: 200),
              const SizedBox(height: 16),
              const Text(
                'Lung Disease Analysis',
                style: AppStyles.font30SemiBold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'Upload your chest scan and let Tamenny assist with a trusted AI-based analysis.',
                style: AppStyles.font16Regular,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          const SizedBox(height: 30),
          buildStepIndicator(
            step: '1',
            title: 'Upload Your Scan',
            description:
                'Select and upload a clear image of your chest X-ray or CT scan to begin the analysis.',
            icon: Icons.upload_file_rounded,
          ),
          const Divider(height: 40),
          buildStepIndicator(
            step: '2',
            title: 'AI Analysis',
            description:
                'Tamenny’s AI will analyze your scan and deliver results in just a few minutes.',
            icon: Icons.analytics_outlined,
          ),
          const Divider(height: 40),
          buildStepIndicator(
            step: '3',
            title: 'Get Results & Next Steps',
            description:
                'Our AI will highlight issues, detect early-stage lung conditions like COPD, and provide guidance on the next steps.',
            icon: Icons.check_circle_outline,
          ),
          const SizedBox(height: 40),
          buildBenefitsSection(),
          const SizedBox(height: 40),
          CustomAppButton(
            text: 'Proceed to Upload',
            onTap: () {
              Navigator.pushNamed(context, Routes.uploadFileView);
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
