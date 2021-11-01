import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PasswordTextFormField extends StatefulWidget {
  PasswordTextFormField({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool hasEightCharacters = false;

  bool hasCapitalLetter = false;

  bool hasADigit = false;

  bool hasASpecialCharacter = false;

  bool hasSmallCapsLetter = false;

  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() =>
          hasCapitalLetter = widget.controller.text.contains(RegExp(r'[A-Z]')));

      setState(
          () => hasADigit = widget.controller.text.contains(RegExp(r'[0-9]')));

      setState(() => hasEightCharacters = widget.controller.text.length >= 8);

      setState(() => hasASpecialCharacter =
          widget.controller.text.contains(RegExp(r'[!@#\$&*~^%()+=|]')));

      setState(() => hasSmallCapsLetter =
          widget.controller.text.contains(RegExp(r'[a-z]')));

      debugPrint(
          "String contains a character: ${widget.controller.text.contains(RegExp(r'[!@#\$&*~^%()+=|]'))}");
      debugPrint(
          "String contains a number: ${widget.controller.text.contains(RegExp(r'[0-9]'))}");
      debugPrint(
          "String contains a capital letter: ${widget.controller.text.contains(RegExp(r'[A-Z]'))}");
      debugPrint(
          "String contains at least 8 characters: ${widget.controller.text.length >= 8}");

      debugPrint(
          "String contains a small caps letter: ${widget.controller.text.contains(RegExp(r'[a-z]'))}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [],
          ),
          TextFormField(
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}
