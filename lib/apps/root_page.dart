import 'package:flutter/material.dart';
import 'package:shopping_app/pages/auth/login_page.dart';
import 'package:shopping_app/pages/home/home_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});
  @override
  Widget build(BuildContext context) {
    bool isLogin = false;
    if (isLogin) {
      return const HomePage();
    } else {
      return const LoginPage();
    }
  }
}
