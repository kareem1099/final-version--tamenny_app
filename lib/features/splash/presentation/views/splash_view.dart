import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tamenny_app/core/databases/cache_helper.dart';
import 'package:tamenny_app/core/di/service_locator.dart';
import 'package:tamenny_app/core/routes/routes.dart';
import 'package:tamenny_app/core/theme/app_colors.dart';
import 'package:tamenny_app/core/theme/app_styles.dart';
import 'package:tamenny_app/core/utils/app_assets.dart';

import 'functions/custom_navigation_from_splash_to_another_views.dart';
import 'widgets/logo_name_with_animation.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    bool? isOnboardingVisited =
        getIt<CacheHelper>().getData(key: 'isOnboardingVisited') ?? false;
    CustomNavigationFromSplashToAnotherViews(context ,isOnboardingVisited);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 50,
              child: SvgPicture.asset(
                Assets.imagesLogo,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            const LogoNameWithAnimation(),
          ],
        ),
      ),
    );
  }
}
