import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/theme/app_styles.dart';
import '../../../../../core/utils/app_assets.dart';

class HomeCustomAppBar extends StatelessWidget {
  const HomeCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(
          Assets.imagesProfiel,
        ),
      ),
      title: const Text(
        'Hi, Muaz!',
        style: AppStyles.font18Bold,
      ),
      subtitle: Text(
        'How are you Today?',
        style: AppStyles.font11Regular.copyWith(
          color: const Color(0xff616161),
        ),
      ),
      trailing: GestureDetector(
        onTap: () {
          Navigator.of(context, rootNavigator: true)
              .pushNamed(Routes.notificationView);
        },
        child: CircleAvatar(
          radius: 24,
          backgroundColor: const Color(0xffF5F5F5),
          child: SvgPicture.asset(Assets.imagesNotificationFoundIcon),
        ),
      ),
    );
  }
}
