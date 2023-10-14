import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/pages/auth/login_page.dart';
import 'package:shopping_app/pages/bottom_nav_bar.dart';
import 'package:shopping_app/pages/home/home_page.dart';
import 'package:shopping_app/pages/intro_screen/intro_screen.dart';
import 'package:shopping_app/providers/data_provider.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none) {
            return const Scaffold(
              backgroundColor: Colors.amber,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.active) {
            User? user = snapshot.data;

            if (user == null) {
              return const LoginPage();
            }

            return const BottomNavBarPage();
          } else {
            return const Scaffold(
              backgroundColor: Colors.amber,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
