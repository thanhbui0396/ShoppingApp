import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/pages/home/popular_deals/widget/popular_card.dart';

class PopularDeas extends StatelessWidget {
  const PopularDeas({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: Text(
                'Popular Deals',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset('assets/images/icons/arrow_right.svg'),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 1.5 / 2.6,
          ),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return const PopularCard();
          },
        ),
      ],
    );
  }
}
