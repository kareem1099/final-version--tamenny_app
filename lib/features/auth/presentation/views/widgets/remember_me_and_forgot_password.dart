import 'package:flutter/material.dart';
import 'package:tamenny_app/features/auth/presentation/views/widgets/remember_me_widget.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class RememberMeWidgetAndForgotPassword extends StatelessWidget {
  const RememberMeWidgetAndForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const RememberMeWidget(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.forgotPasswordView,
            );
          },
          child: Text(
            'Forgot Password?',
            style: AppStyles.font12Regular.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
