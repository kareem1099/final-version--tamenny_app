import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../core/routes/routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_app_button.dart';

class ProcessingScreen extends StatefulWidget {
  const ProcessingScreen({super.key});

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  @override
  void initState() {
    Future.delayed(
      Duration(milliseconds: 5000),
      () => Navigator.pushNamed(context , Routes.completedScreen),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Scan'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Processing',
                textAlign: TextAlign.center,
                style: AppStyles.font48SemiBold
                    .copyWith(color: AppColors.primaryColor),
              ),
            ),
            SizedBox(
                height: 350,
                width: 250,
                child: Image.asset(Assets.imagesAiProcessingModel)),
            SizedBox(
              height: 76,
            ),
            LinearPercentIndicator(
              progressColor: AppColors.primaryColor,
              percent: 0.8,
              animationDuration: 2500,
              animation: true,
              linearStrokeCap: LinearStrokeCap.roundAll,
              lineHeight: 10.0,
              barRadius: Radius.circular(16),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'AI in action! Tamenny is analyzing your data to provide a personalized assessment. Sit tight!',
                textAlign: TextAlign.center,
                style:
                    AppStyles.font16SemiBold.copyWith(color: Color(0xff242424)),
              ),
            ),
            SizedBox(
              height: 53,
            ),
            CustomAppButton(
              text: 'Upload File',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
