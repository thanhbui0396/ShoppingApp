import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/data_provider.dart';

class BodyAppbarAndSearch extends StatelessWidget {
  BodyAppbarAndSearch(
      {super.key, required this.textEditingController, this.handleOnchange});

  final TextEditingController textEditingController;
  Function? handleOnchange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
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
                  child: Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          top: 11,
                          bottom: 11,
                          left: 19,
                        ),
                        height: 42,
                        width: 86,
                        decoration: const BoxDecoration(
                          color: Color(0xFFEDEDED),
                          borderRadius: BorderRadius.all(
                            Radius.circular(54),
                          ),
                        ),
                        child: const Text(
                          '6',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Positioned(
                        right: -3,
                        top: -3,
                        height: 48,
                        width: 48,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        height: 42,
                        width: 42,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFFC29C1D),
                          child: SvgPicture.asset(
                              'assets/images/icons/icon-notifi.svg'),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
          const SizedBox(
            height: 13,
          ),
          TextField(
            onChanged: (value) {
              handleOnchange;
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
