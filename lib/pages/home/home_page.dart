import 'package:flutter/material.dart';
import 'package:shopping_app/pages/home/body_category/body_category.dart';
import 'package:shopping_app/pages/home/popular_deals/popular_deals.dart';
import 'package:shopping_app/pages/home/widget/body_appbar_and_search.dart';
import 'package:shopping_app/pages/home/widget/slider_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    void handleOnChange(String value) {
      print(value);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyAppbarAndSearch(
                  textEditingController: textEditingController,
                  handleOnchange: handleOnChange,
                ),
                const SizedBox(
                  height: 20,
                ),
                const SliderBody(),
                const SizedBox(
                  height: 26,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Column(
                    children: [
                      BodyCategory(),
                      SizedBox(
                        height: 26,
                      ),
                      PopularDeas(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
