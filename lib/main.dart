import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tamenny_app/core/routes/app_router.dart';
import 'package:tamenny_app/tamenny_app.dart';

import 'core/databases/cache_helper.dart';
import 'core/di/service_locator.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance.authStateChanges().listen(
    (User? user) {
      if (user == null) {
        log('User is currently signed out!');
      } else {
        log('User is signed in!');
      }
    },
  );
  setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(
    TamennyApp(
      appRouter: AppRouter(),
    ),
  );
}
