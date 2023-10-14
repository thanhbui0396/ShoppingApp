import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/pages/home/body_category/body_category.dart';
import 'package:shopping_app/pages/home/popular_deals/popular_deals.dart';
import 'package:shopping_app/pages/home/widget/body_appbar_and_search.dart';
import 'package:shopping_app/pages/home/widget/slider_body.dart';
import 'package:shopping_app/providers/image_slider_providers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController textEditingController = TextEditingController();
  void handleOnChange(String value) {
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    context.read<ImageSliderProviders>().getImagesSlider;

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
