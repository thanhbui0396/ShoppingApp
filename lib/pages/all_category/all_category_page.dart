import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/pages/home/body_category/widget/category_card.dart';

class AllCategoryPage extends StatelessWidget {
  const AllCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    List lisCategory = [
      {
        'name': 'Fruits',
        'icon': 'assets/images/icons/Fruit.svg',
        'item_count': 45,
      },
      {
        'name': 'Vegetables',
        'icon': 'assets/images/icons/vegetables.svg',
        'item_count': 45,
      },
      {
        'name': 'Bakery',
        'icon': 'assets/images/icons/bakery.svg',
        'item_count': 45,
      },
      {
        'name': 'Dairy',
        'icon': 'assets/images/icons/cheese.svg',
        'item_count': 45,
      },
      {
        'name': 'Mushroom',
        'icon': 'assets/images/icons/mushroom.svg',
        'item_count': 45,
      },
      {
        'name': 'Fish',
        'icon': 'assets/images/icons/fish.svg',
        'item_count': 45,
      },
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Categories',
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
            child: SvgPicture.asset('assets/images/icons/option.svg'),
          ),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
              childAspectRatio: 1.5 / 1.6),
          itemCount: lisCategory.length,
          itemBuilder: (BuildContext context, int index) {
            return CategoryCard(
              name: lisCategory[index]['name'],
              indexColor: index,
              icon: lisCategory[index]['icon'],
              itemCount: lisCategory[index]['item_count'],
              isSmallSize: false,
            );
          },
        ),
      ),
    );
  }
}
