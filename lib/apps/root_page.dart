import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/pages/auth/login_page.dart';
import 'package:shopping_app/pages/home/home_page.dart';
import 'package:shopping_app/pages/intro_screen/intro_screen.dart';
import 'package:shopping_app/providers/data_provider.dart';

// class RootPage extends StatefulWidget {
//   const RootPage({
//     super.key,
//   });

//   @override
//   State<RootPage> createState() => _RootPageState();
// }

// class _RootPageState extends State<RootPage> {
//   late bool isIntro;
//   late bool isLogin;

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     isIntro = context.watch<DataProvider>().isIntro;
//     isLogin = context.watch<DataProvider>().isLogin;

//     if (isIntro) {
//       return const IntroScreen();
//     } else {
//       if (isLogin) {
//         return const HomePage();
//       } else {
//         return const LoginPage();
//       }
//     }
//   }
// }

class RootPage extends StatelessWidget {
  const RootPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, dataProvider, _) {
        final isIntro = dataProvider.num;
        final isLogin = dataProvider.isLogin;

        if (isIntro == 0) {
          return const IntroScreen();
        } else {
          if (isLogin) {
            return const HomePage();
          } else {
            return const LoginPage();
          }
        }
      },
    );
  }
}
