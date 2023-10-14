import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/apps/routers/router.dart';
import 'package:shopping_app/apps/routers/router_name.dart';
import 'package:shopping_app/apps/themes/theme.dart';
import 'package:shopping_app/providers/auth_providers.dart';
import 'package:shopping_app/providers/data_provider.dart';
import 'package:shopping_app/providers/image_slider_providers.dart';
import 'package:shopping_app/providers/info_providers.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DataProvider()..loadData(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProviders(),
        ),
        ChangeNotifierProvider(
          create: (_) => InfoProviders(),
        ),
        ChangeNotifierProvider(
          create: (_) => ImageSliderProviders()..getImagesSlider(),
        ),
      ],
      child: const App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // bool data = context.read<DataProvider>().isIntro;
    // if (state == AppLifecycleState.inactive) {
    //   SharedCustom.saveIntro('isIntro', data);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      debugShowCheckedModeBanner: false,
      theme: ThemeCustom.lightTheme,
      darkTheme: ThemeCustom.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: RouterName.rootPage,
      onGenerateRoute: RouterCustom.onGenerateRoute,
      builder: EasyLoading.init(),
    );
  }
}
