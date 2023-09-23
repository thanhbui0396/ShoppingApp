import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/data_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController = TextEditingController();
    void handleOnChange(String value) {
      print(value);
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Good Morning',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Louis',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              context.read<DataProvider>().checkLogOut();
                            },
                            child: const Icon(Icons.notifications))
                      ],
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    TextField(
                      onChanged: (value) {
                        handleOnChange(value);
                      },
                      controller: textEditingController,
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF7D8FAB)),
                        hintText: 'Search beverages or foods',
                        prefixIcon: Icon(
                          CupertinoIcons.search,
                          color: Colors.grey.shade500,
                        ),
                        focusedBorder: inputCustomBorder(),
                        enabledBorder: inputCustomBorder(),
                        disabledBorder: inputCustomBorder(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 0.8,
                  height: 168,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlay: true,
                ),
                items: List.generate(
                  3,
                  (index) => Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                        color: Colors.amber),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

InputBorder inputCustomBorder() {
  return OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade300,
      ),
      borderRadius: BorderRadius.circular(12.0));
}
