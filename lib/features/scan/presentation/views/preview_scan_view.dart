import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tamenny_app/core/widgets/custom_app_button.dart';

import '../../../../core/routes/routes.dart';

class PreviewScanView extends StatefulWidget {
  const PreviewScanView({super.key});

  @override
  State<PreviewScanView> createState() => _PreviewScanViewState();
}

class _PreviewScanViewState extends State<PreviewScanView> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedImage;

  Future<void> _pickImageFromGallery() async {
    final image = await _imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = image != null ? XFile(image.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Spacer(),
              InkWell(
                onTap: _pickImageFromGallery,
                child: Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: _pickedImage != null
                      ? Image.file(
                          File(_pickedImage!.path),
                          height: 200,
                        )
                      : Icon(
                          Icons.add_photo_alternate_outlined,
                          size: 30,
                        ),
                ),
              ),
              Spacer(),
              CustomAppButton(
                  text: 'Done',
                  onTap: () {
                    Navigator.pushNamed(context, Routes.processingScreen);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
