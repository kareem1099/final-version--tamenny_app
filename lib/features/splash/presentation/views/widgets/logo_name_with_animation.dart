import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_styles.dart';

class LogoNameWithAnimation extends StatelessWidget {
  const LogoNameWithAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: AnimatedTextKit(
        repeatForever: false,
        totalRepeatCount: 1,
        animatedTexts: [
          TyperAnimatedText(
            'Tamenny',
            textStyle: AppStyles.font32Bold.copyWith(
              color: AppColors.blueDarkColor,
            ),
            speed: const Duration(
              milliseconds: 100,
            ),
          ),
        ],
      ),
    );
  }
}
