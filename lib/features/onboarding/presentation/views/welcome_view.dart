import 'package:flutter/material.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';

import '../../../../core/widgets/already_have_an_account.dart';
import 'widgets/get_started_custom_button.dart';
import 'widgets/header_logo_welcome_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(
                height: 24,
              ),
              const HeaderLogoWelcomeView(),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Welcome to the TAMENNY',
                textAlign: TextAlign.center,
                style: AppStyles.font30ExtraBold.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Your mindful mental health AI companion for everyone, anywhere 🍃',
                textAlign: TextAlign.center,
                style: AppStyles.font18Medium,
              ),
              const SizedBox(
                height: 32,
              ),
              Image.asset(Assets.imagesOnboarding1),
              const SizedBox(
                height: 32,
              ),
              const GetStartedButton(),
              const SizedBox(
                height: 30,
              ),
              const AlreadyHaveAnAccount()
            ],
          ),
        ),
      ),
    );
  }
}
