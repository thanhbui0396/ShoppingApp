import 'package:flutter/material.dart';
import 'package:shopping_app/apps/routers/router.dart';
import 'package:shopping_app/apps/routers/router_name.dart';
import 'package:shopping_app/apps/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int num = 1;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeCustom.lightTheme,
      darkTheme: ThemeCustom.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: (num > 0) ? RouterName.rootPage : RouterName.introScreen,
      onGenerateRoute: RouterCustom.onGenerateRoute,
    );
  }
}
