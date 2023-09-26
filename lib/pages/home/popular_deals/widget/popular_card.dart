import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping_app/apps/routers/router_name.dart';
import 'package:shopping_app/apps/themes/theme.dart';

class PopularCard extends StatefulWidget {
  const PopularCard({
    super.key,
  });

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  bool isFavorite = false;
  int numOrder = 0;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, RouterName.productDetailPage);
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          border: Border.all(width: 0, color: const Color(0xFFE8EFF3)),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      color: Color(0xFFC4C4C4),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: StatefulBuilder(
                      builder: (context, setState) => InkWell(
                          onTap: () {
                            setState(
                              () => isFavorite = !isFavorite,
                            );
                          },
                          child: SvgPicture.asset(isFavorite
                              ? 'assets/images/icons/love.svg'
                              : 'assets/images/icons/love_out.svg')),
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: -30,
                    child: Transform.rotate(
                      angle: 45 * pi / 180,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        alignment: Alignment.center,
                        width: 100,
                        color: Colors.red,
                        child: const Text(
                          '5% OFF',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Chicken Village',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: Text(
                            '\$ 10.9',
                            style: TextStyle(
                                color: Color(0xFFC29C1D),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              '(243)',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF7D8FAB),
                              ),
                            ),
                            SvgPicture.asset('assets/images/icons/star.svg')
                          ],
                        )
                      ],
                    ),
                    StatefulBuilder(
                      builder: (context, setState) => (numOrder == 0)
                          ? InkWell(
                              onTap: () {
                                setState(() => numOrder = 1);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 11,
                                ),
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFC8EDD9),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  'Add to cart',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: main_light,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  height: 36,
                                  width: 36,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(
                                        () => numOrder -= 1,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(0),
                                        backgroundColor: main_light,
                                        elevation: 0),
                                    child: const Center(
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  '$numOrder',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: main_light,
                                  ),
                                ),
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(12),
                                    ),
                                  ),
                                  height: 36,
                                  width: 36,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(
                                        () => numOrder += 1,
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.all(0),
                                        backgroundColor: main_light,
                                        elevation: 0),
                                    child: const Center(
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                          fontSize: 24,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
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
