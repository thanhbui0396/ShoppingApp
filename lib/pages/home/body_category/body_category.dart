import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/apps/routers/router_name.dart';
import 'package:shopping_app/pages/home/body_category/widget/category_card.dart';

class BodyCategory extends StatefulWidget {
  const BodyCategory({super.key});

  @override
  State<BodyCategory> createState() => _BodyCategoryState();
}

class _BodyCategoryState extends State<BodyCategory> {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouterName.allCategoryPage);
              },
              child: SvgPicture.asset('assets/images/icons/arrow_right.svg'),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          clipBehavior: Clip.none,
          height: 96,
          child: ListView.separated(
            clipBehavior: Clip.none,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: lisCategory.length,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 12,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return CategoryCard(
                name: lisCategory[index]['name'],
                icon: lisCategory[index]['icon'],
                itemCount: lisCategory[index]['item_count'],
                indexColor: index,
              );
            },
          ),
        ),
      ],
    );
  }
}
