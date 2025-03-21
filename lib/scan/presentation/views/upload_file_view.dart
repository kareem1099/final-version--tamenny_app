import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';
import 'package:tamenny_app/core/utils/data/models/models_arguments.dart';
import 'package:tamenny_app/core/widgets/custom_app_bar.dart';
import 'dart:io';

import '../../../core/routes/routes.dart';
import '../../../core/widgets/custom_app_button.dart';

class UploadFileView extends StatefulWidget {
  const UploadFileView({super.key});

  @override
  State<UploadFileView> createState() => _UploadFileViewState();
}

class _UploadFileViewState extends State<UploadFileView> {
  XFile? image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String moduleRoute = ModalRoute.of(context)!.settings.arguments! as String;

    return Scaffold(
      appBar: customAppBar(context, title: 'Scan'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: image == null
                  ? Image.asset(Assets.imagesDoctorUploadFile)
                  : Image.file(File(image!.path)),
            ),
            Text(
              'Upload File',
              textAlign: TextAlign.center,
              style: AppStyles.font48SemiBold
                  .copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Tap to upload your file! Let’s help you analyze your health data and provide insights.',
              textAlign: TextAlign.center,
              style:
              AppStyles.font16SemiBold.copyWith(color: const Color(0xff242424)),
            ),
            const SizedBox(
              height: 60,
            ),
            if (image != null)
              CustomAppButton(
                text: 'Next',
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.completedScreen,
                    arguments: modelArguments(key: moduleRoute, image: image!),
                  );
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