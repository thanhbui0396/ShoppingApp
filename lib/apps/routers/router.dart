import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping_app/apps/root_page.dart';
import 'package:shopping_app/apps/routers/router_name.dart';
import 'package:shopping_app/pages/account_page/account_page.dart';
import 'package:shopping_app/pages/all_category/all_category_page.dart';
import 'package:shopping_app/pages/auth/login_page.dart';
import 'package:shopping_app/pages/auth/register_page.dart';
import 'package:shopping_app/pages/bottom_nav_bar.dart';
import 'package:shopping_app/pages/error/error_page.dart';
import 'package:shopping_app/pages/home/home_page.dart';
import 'package:shopping_app/pages/intro_screen/intro_screen.dart';
import 'package:shopping_app/pages/product_detail_page/product_detail_page.dart';
import 'package:shopping_app/pages/products/products_page.dart';

class RouterCustom {
  static Route onGenerateRoute(RouteSettings settings) {
    // if (settings.name == RouterName.productsPage) {
    //   final  args = settings.arguments as ScreenArguments;
    // }
    switch (settings.name) {
      case RouterName.introScreen:
        return page(const IntroScreen());

      case RouterName.loginPage:
        return page(const LoginPage());
      case RouterName.rootPage:
        return page(const RootPage());
      case RouterName.homePage:
        return page(const HomePage());
      case RouterName.registerPage:
        return page(const RegisterPage());
      case RouterName.productDetailPage:
        return page(const ProductDetailPage());
      case RouterName.allCategoryPage:
        return page(const AllCategoryPage());
      case RouterName.productsPage:
        return page(const ProductsPage());
      case RouterName.accountPage:
        return page(const AccountPage());
      case RouterName.bottomNavBarPage:
        return page(const BottomNavBarPage());
      default:
        return _errorPage();
    }
  }

  static _errorPage() {
    return page(const ErrorPage());
  }

  static PageTransition<dynamic> page(Widget routerPage) =>
      PageTransition(child: routerPage, type: PageTransitionType.fade);
}
