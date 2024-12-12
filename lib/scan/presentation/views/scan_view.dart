import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tamenny_app/core/routes/routes.dart';

class ScanView extends StatelessWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async{
                await FirebaseAuth.instance.signOut();
                      Navigator.of(context, rootNavigator: true)
                    .pushNamed(Routes.loginView);
              },
              icon: Icon(Icons.logout_outlined))
        ],
      ),
      body: Center(
        child: Text('Scan  View'),
      ),
    );
  }
}
