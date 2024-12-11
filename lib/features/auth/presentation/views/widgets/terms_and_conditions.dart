import 'package:flutter/material.dart';

import '../../../../../core/theme/app_styles.dart';

class TermsAndConditionsAndPrivacyPolicy extends StatelessWidget {
  const TermsAndConditionsAndPrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: 'By Logging , you agree to our ',
            style: AppStyles.font12Regular.copyWith(
              color: Color(0xff9E9E9E),
            ),
          ),
          TextSpan(
            text: 'Terms & Conditions ',
            style: AppStyles.font14Medium.copyWith(
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'and ',
            style: AppStyles.font12Regular.copyWith(
              color: Color(0xff9E9E9E),
            ),
          ),
          TextSpan(
            text: 'PrivacyPolicy',
            style: AppStyles.font14Medium.copyWith(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
