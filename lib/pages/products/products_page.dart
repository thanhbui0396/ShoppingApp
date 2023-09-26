import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/pages/products/widget/input_search.dart';
import 'package:shopping_app/pages/products/widget/product_card.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({
    super.key,
  });

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  void handleOnChange(String value) {}
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Fish',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          leading: const BackButton(
            color: Colors.black,
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: SvgPicture.asset('assets/images/icons/filter.svg'),
            ),
            const SizedBox(
              width: 16,
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset('assets/images/icons/option.svg'),
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: InputSearch()),
              const SizedBox(
                height: 16,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return const ProductCard();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
