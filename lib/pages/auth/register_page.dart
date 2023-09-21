import 'package:flutter/material.dart';
import 'package:shopping_app/apps/const/value.dart';
import 'package:shopping_app/pages/auth/widget/button_login.dart';
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
  void handleRegister() {
    print('2322222');
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
                      onTap: () {},
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              textCheck1,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF7D8FAB),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Material(
                                  clipBehavior: Clip.hardEdge,
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Text(
                                      textCheck2,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  textCheck3,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF7D8FAB),
                                  ),
                                ),
                                Material(
                                  clipBehavior: Clip.hardEdge,
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Text(
                                      textCheck4,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
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
                            onTap: handleRegister,
                            isOutLine: true,
                          ),
                        ],
                      ),
                    ),
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
