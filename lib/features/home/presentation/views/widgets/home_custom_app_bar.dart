import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/utils/app_assets.dart';

class HomeCustomAppBar extends StatelessWidget {
  const HomeCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(
              Assets.imagesProfiel,
            ),
          ),
        ),
        const SizedBox(
          width: 13,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hi, Kareem!',
                      style: AppStyles.font18Bold,
                    ),
                    Text(
                      'How are you Today?',
                      style: AppStyles.font11Regular.copyWith(
                        color: const Color(0xff616161),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(Routes.notificationView);
                  },
                  child: CircleAvatar(
                      radius: 24,
                      backgroundColor: const Color(0xffF5F5F5),
                      child:
                          SvgPicture.asset(Assets.imagesNotificationFoundIcon)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
