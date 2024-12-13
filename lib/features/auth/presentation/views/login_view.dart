import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/features/auth/presentation/views/widgets/custom_clip_path_with_logo.dart';
import 'widgets/login_form_section.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: AppColors.primaryColor,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          ),
      child: Scaffold(
        body: ListView(
          children: const [
            CustomClipPathWithLogo(),
            LoginFormSection(),
          ],
        ),
      ),
    );
  }
}
