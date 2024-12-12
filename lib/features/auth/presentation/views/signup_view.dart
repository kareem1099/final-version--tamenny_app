import 'package:flutter/material.dart';
import 'widgets/custom_clip_path_with_logo.dart';
import 'widgets/signup_form_section.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          CustomClipPathWithLogo(),
          SignupFormSection(),
        ],
      ),
    );
  }
}
