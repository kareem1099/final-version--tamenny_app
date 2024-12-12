import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/utils/app_assets.dart';

class HealthScanItemWidget extends StatelessWidget {
  const HealthScanItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: Color(0xffF4F8FF),
          child: SvgPicture.asset(
            Assets.imagesCardiologistIcon,
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'General',
          style: AppStyles.font12Regular,
        ),
      ],
    );
  }
}
