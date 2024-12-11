import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tamenny_app/core/routes/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home View'),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, Routes.loginView);
              },
              icon: Icon(Icons.logout))
        ],
      ),
    );
  }
}
