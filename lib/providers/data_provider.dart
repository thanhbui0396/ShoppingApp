import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shopping_app/apps/const/shared_pre.dart';

class DataProvider extends ChangeNotifier {
  bool isLogin = false;
  bool isIntro = true;
  int num = 0;

  void checkLogin() {
    isLogin = true;
    SharedCustom.saveIsLogin('isLogin', isLogin);
    notifyListeners();
  }

  void checkLogOut() async {
    isLogin = false;
    await FirebaseAuth.instance.signOut();
    SharedCustom.saveIsLogin('isLogin', isLogin);

    notifyListeners();
  }

  void checkIntro() {
    num++;
    SharedCustom.saveIntro('numIntro', num);
    notifyListeners();
  }

  void loadData() async {
    num = await SharedCustom.getsIntro('numIntro');
    isLogin = await SharedCustom.getsIsLogin('isLogin');

    notifyListeners();
  }
}
