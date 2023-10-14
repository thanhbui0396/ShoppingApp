import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/apps/const/value.dart';
import 'package:shopping_app/apps/routers/router_name.dart';
import 'package:shopping_app/pages/auth/widget/button_login.dart';
import 'package:shopping_app/providers/auth_providers.dart';
import 'package:shopping_app/providers/info_providers.dart';
import 'package:shopping_app/widgets/input_body.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController controllerUserName = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final GlobalKey<FormState> _globalKeyLogin = GlobalKey<FormState>();
  bool isChecked = false;
  Future<void> handleRegister() async {
    FocusManager.instance.primaryFocus?.unfocus();
    EasyLoading.show(status: 'Loading');
    await context
        .read<AuthProviders>()
        .createAccount(controllerEmail.text, controllerPassword.text)
        .onError((error, stackTrace) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(error.toString())));
      return null;
    }).then((UserCredential) async {
      if (UserCredential != null) {
        await context
            .read<InfoProviders>()
            .addUser(controllerUserName.text, UserCredential.user!.uid);

        EasyLoading.dismiss();
        await Future.delayed(const Duration(milliseconds: 30));
        EasyLoading.showSuccess('Success');
        await Future.delayed(const Duration(milliseconds: 30));
        Navigator.pop(context);
      }
    });
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    controllerUserName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.only(bottom: 33),
                alignment: Alignment.bottomCenter,
                child: Text(
                  textAppName,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 35,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textHeaderRegis,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        textDesRegister,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 27,
                      ),
                      Form(
                        key: _globalKeyLogin,
                        child: Column(
                          children: [
                            InputBody(
                              label: textLabelUsername,
                              controller: controllerUserName,
                              isPassword: false,
                              assetName: iconUser,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            InputBody(
                              label: textLabelEmail,
                              controller: controllerEmail,
                              isPassword: false,
                              assetName: iconEmail,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            InputBody(
                              label: textLabelPassword,
                              controller: controllerPassword,
                              isPassword: true,
                              assetName: iconPassword,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ButtonLogin(
                        text: textButtonRegister,
                        onTap: handleRegister,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          StatefulBuilder(
                            builder: (context, setState) => Container(
                              margin: const EdgeInsets.only(bottom: 15),
                              child: Checkbox(
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  checkColor: Colors.white,
                                  activeColor: Theme.of(context).primaryColor,
                                  fillColor: MaterialStatePropertyAll(
                                      Theme.of(context).primaryColor),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  }),
                            ),
                          ),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: textCheck1,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF7D8FAB),
                                    ),
                                  ),
                                  TextSpan(
                                    text: textCheck2,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    onEnter: (event) {
                                      print(event);
                                    },
                                  ),
                                  const TextSpan(
                                    text: textCheck3,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF7D8FAB),
                                    ),
                                  ),
                                  TextSpan(
                                    text: textCheck4,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Center(
                            child: Text(
                              textQuestionRegister,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF7D8FAB),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ButtonLogin(
                            text: textBuottonSingIn,
                            onTap: () async {
                              await Future.delayed(
                                  const Duration(milliseconds: 30));
                              Navigator.pop(context);
                            },
                            isOutLine: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
