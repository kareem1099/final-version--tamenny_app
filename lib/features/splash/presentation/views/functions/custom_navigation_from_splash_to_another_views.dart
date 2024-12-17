import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../core/databases/cache_helper.dart';
import '../../../../../core/di/service_locator.dart';
import '../../../../../core/routes/routes.dart';

Future<Null> CustomNavigationFromSplashToAnotherViews(BuildContext context,
    bool? isOnboardingVisited) {
  return Future.delayed(
    const Duration(milliseconds: 5000),
    () {
      if (isOnboardingVisited == true) {
        FirebaseAuth.instance.currentUser == null
            ? Navigator.pushReplacementNamed(context, Routes.loginView)
            : FirebaseAuth.instance.currentUser!.emailVerified == true
                ? Navigator.pushReplacementNamed(context, Routes.bottomNavBarView)
                : Navigator.pushReplacementNamed(context, Routes.loginView);
      } else {
        getIt<CacheHelper>().saveData(key: 'isOnboardingVisited', value: true);
        Navigator.pushReplacementNamed(context, Routes.welcomeView);
      }
    },
  );
}
