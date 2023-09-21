import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputBody extends StatefulWidget {
  InputBody({
    super.key,
    required this.label,
    required this.controller,
    required this.isPassword,
    this.assetName = '',
  });
  final String label;
  TextEditingController controller = TextEditingController();
  final bool isPassword;
  String assetName;

  @override
  State<InputBody> createState() => _InputBodyState();
}

class _InputBodyState extends State<InputBody> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Vui long dien thong tin';
        }
        return null;
      },
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      controller: widget.controller,
      obscureText: widget.isPassword ? _isObscure : false,
      cursorColor: Theme.of(context).primaryColor,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE8EFF3),
        suffixIconColor: Theme.of(context).primaryColor,
        errorBorder: boderInput(),
        focusedErrorBorder: boderInput(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Theme.of(context).primaryColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        enabledBorder: boderInput(),
        disabledBorder: boderInput(),
        hintText: widget.label,
        prefixIcon: widget.assetName.isEmpty
            ? null
            : Padding(
                padding: const EdgeInsets.all(14),
                child: SvgPicture.asset(widget.assetName)),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon:
                    Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                })
            : null,
      ),
    );
  }

  OutlineInputBorder boderInput() => const OutlineInputBorder(
      borderSide: BorderSide(
        width: 0,
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.all(Radius.circular(14)));
}
