import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputSearch extends StatelessWidget {
  const InputSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        print(value);
      },
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE8EFF3),
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
    );
  }
}

InputBorder inputCustomBorder() {
  return OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color(0xFFE8EFF3),
      ),
      borderRadius: BorderRadius.circular(12.0));
}
