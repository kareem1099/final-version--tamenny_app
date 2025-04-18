import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

import '../../../core/routes/routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_styles.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/data/models/models_arguments.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/custom_app_button.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  late modelArguments moduleRoute;
  String _result = ""; // To store the result from the server
  bool _isLoading = false; // To show a loading indicator

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final routeArgs = ModalRoute.of(context)!.settings.arguments;
      if (routeArgs != null && routeArgs is modelArguments) {
        setState(() {
          moduleRoute = routeArgs;
        });
      }
    });
  }

  Future<void> _uploadImage() async {
    if (moduleRoute.image == null) {
      setState(() {
        _result = "No image selected.";
      });
      return;
    }

    setState(() {
      _isLoading = true; // Show loading indicator
    });

    try {
      // Create a multipart request
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://3157-197-38-175-23.ngrok-free.app/predict_${moduleRoute.key}'), // Replace with your server IP
      );

      // Attach the image file
      request.files.add(
        await http.MultipartFile.fromPath(
          'file', // This should match the parameter name in FastAPI
          moduleRoute.image!.path,
        ),
      );

      // Send the request
      var response = await request.send();

      if (response.statusCode == 200) {
        // Parse the response
        var responseData = await response.stream.bytesToString();
        var jsonResponse = json.decode(responseData);

        // Update the result string
        setState(() {
          _result = "Result: ${jsonResponse['result']}\nConfidence: ${jsonResponse['confidence']}";
        });
      } else {
        // Handle server errors
        setState(() {
          _result = "Error: ${response.statusCode}";
        });
      }
    } catch (e) {
      // Handle network or other errors
      setState(() {
        _result = "Error: $e";
      });
    } finally {
      setState(() {
        _isLoading = false; // Hide loading indicator
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff094E6C),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: [
              Image.asset(Assets.imagesDoctorCompletedModel),
              const SizedBox(
                height: 57,
              ),
              Text(
                'Completed',
                textAlign: TextAlign.center,
                style: AppStyles.font48SemiBold.copyWith(color: Colors.white),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  'Good health starts with awareness. Thanks for letting Tamenny help you take that step!',
                  textAlign: TextAlign.center,
                  style: AppStyles.font16Medium.copyWith(color: Colors.white60),
                ),
              ),
              const SizedBox(
                height: 108,
              ),
              CustomAppButton(
                text: 'Show Results',
                bgColor: const Color(0xffD3A9FF).withOpacity(0.25),
                onTap: () async {
                  await _uploadImage(); // Send the image and get the result
                  if (_result.isNotEmpty) {
                    // Navigate to the results screen with the result
                    Navigator.pushNamed(
                      context,
                      Routes.scanAnalysisResultsScreen,
                      arguments: modelArguments(key: _result, image: moduleRoute.image), // Pass the result as an argument
                    );
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              if (_isLoading)
                Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
