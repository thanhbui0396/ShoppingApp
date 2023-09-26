import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/apps/routers/router_name.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    super.key,
    required this.name,
    required this.indexColor,
    required this.icon,
    required this.itemCount,
    this.isSmallSize = true,
  });

  String name;
  int itemCount;
  String icon;
  int indexColor;
  bool isSmallSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          RouterName.productsPage,
        );
      },
      child: Container(
        width: 91,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          color: Colors.accents[indexColor],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: isSmallSize ? 15 : 28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SvgPicture.asset(
                  icon,
                  fit: BoxFit.scaleDown,
                  height: isSmallSize ? 22 : 36,
                  width: isSmallSize ? 22 : 36,
                ),
              ),
              SizedBox(
                height: isSmallSize ? 10 : 15,
              ),
              Text(
                name,
                style: TextStyle(
                  fontSize: isSmallSize ? 14 : 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                '$itemCount items',
                style: TextStyle(
                  fontSize: isSmallSize ? 12 : 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
