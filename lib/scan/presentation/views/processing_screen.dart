import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../core/routes/routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/data/models/models_arguments.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_app_button.dart';

class ProcessingScreen extends StatefulWidget {
  const ProcessingScreen({super.key});

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen> {
  late modelArguments moduleRoute;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final routeArgs = ModalRoute.of(context)?.settings.arguments;
      if (routeArgs is modelArguments) {
        setState(() {
          moduleRoute = routeArgs;
          isLoading = false;
        });
        _makeApiRequest();
      }
    });
  }

  Future<void> _makeApiRequest() async {
    try {
      final response = await http.post(
        Uri.parse('https://5ad9-197-38-100-80.ngrok-free.app/predict_${moduleRoute.key}'),
        body: jsonEncode({'key': moduleRoute.key}),
      );

      if (response.statusCode == 200) {
        _navigateToCompleted(response.body);
      } else {
        _navigateToCompleted('Error: ${response.statusCode}');
      }
    } catch (e) {
      _navigateToCompleted('Exception: $e');
    }
  }

  void _navigateToCompleted(String response) {
    Navigator.pushNamed(
      context,
      Routes.completedScreen,
      arguments: modelArguments(key: response, image: moduleRoute.image),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: 'Scan'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Processing',
                textAlign: TextAlign.center,
                style: AppStyles.font48SemiBold.copyWith(color: AppColors.primaryColor),
              ),
            ),
            SizedBox(
                height: 350,
                width: 250,
                child: Image.asset(Assets.imagesAiProcessingModel)),
            SizedBox(height: 76),
            LinearPercentIndicator(
              progressColor: AppColors.primaryColor,
              percent: 0.8,
              animationDuration: 2500,
              animation: true,
              linearStrokeCap: LinearStrokeCap.roundAll,
              lineHeight: 10.0,
              barRadius: Radius.circular(16),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'AI in action! Tamenny is analyzing your data to provide a personalized assessment. Sit tight!',
                textAlign: TextAlign.center,
                style: AppStyles.font16SemiBold.copyWith(color: Color(0xff242424)),
              ),
            ),
            SizedBox(height: 53),
            CustomAppButton(
              text: 'Upload File',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
