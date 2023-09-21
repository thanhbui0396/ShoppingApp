import 'package:flutter/material.dart';
import 'package:shopping_app/apps/const/value.dart';
import 'package:shopping_app/apps/routers/router_name.dart';
import 'package:shopping_app/pages/auth/widget/button_login.dart';
import 'package:shopping_app/widgets/input_body.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final GlobalKey<FormState> _globalKeyLogin = GlobalKey<FormState>();
  bool isChecked = false;
  void handleCreateAnAccount() {
    Navigator.pushNamed(context, RouterName.registerPage);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            Expanded(
              flex: 2,
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
              flex: 5,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textHeaderLogin,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      textDesLogin,
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
                            controller: controllerEmail,
                            isPassword: false,
                            assetName: iconUser,
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          InputBody(
                            label: textLabelPassword,
                            controller: controllerPassword,
                            isPassword: true,
                            assetName: iconPassword,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ButtonLogin(
                      text: textBuottonSingIn,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              StatefulBuilder(
                                builder: (context, setState) => Checkbox(
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
                              Text(
                                textKeepSignIn,
                                style: Theme.of(context).textTheme.bodySmall,
                              )
                            ],
                          ),
                        ),
                        Material(
                          clipBehavior: Clip.hardEdge,
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {},
                            // child: Text(
                            //   textForgotPassword,
                            //   style: TextStyle(
                            //     fontSize: 16,
                            //     fontWeight: FontWeight.w600,
                            //     color: Theme.of(context).primaryColor,
                            //     decoration: TextDecoration.underline,
                            //     decorationThickness: 2,
                            //   ),
                            // ),
                            child: Container(
                              margin: const EdgeInsets.only(top: 1),
                              padding: const EdgeInsets.only(
                                bottom: 1, // Space between underline and text
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 1.0, // Underline thickness
                                  ),
                                ),
                              ),
                              child: Text(
                                textForgotPassword,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Center(
                          child: Text(
                            textQuestionAccount,
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
                          text: textCreateAccount,
                          onTap: handleCreateAnAccount,
                          isOutLine: true,
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
