import 'package:flutter/material.dart';

class ButtonLogin extends StatelessWidget {
  ButtonLogin(
      {super.key,
      this.isOutLine = false,
      required this.text,
      required this.onTap});
  bool isOutLine;
  String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.none,
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTap(),
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 18),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            color: !isOutLine
                ? Theme.of(context).primaryColor
                : Colors.transparent,
            boxShadow: !isOutLine
                ? [
                    BoxShadow(
                      offset: const Offset(0, 12),
                      blurRadius: 30,
                      spreadRadius: 0,
                      color: Theme.of(context).primaryColor.withOpacity(0.35),
                    ),
                  ]
                : [],
          ),
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16,
              color: !isOutLine ? Colors.white : Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
