import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'localregex.dart';

class PasswordTextFormField extends StatefulWidget {
  PasswordTextFormField({
    Key? key,
    required this.controller,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.showValidationRow = true,
  }) : super(key: key);

  /// The controller required by the password
  /// [TextFormField]
  ///
  final TextEditingController controller;

  /// Determines how frequent the password [TextFormField]
  /// should be validated. Defaults to [AutovalidateMode.onUserInteraction]
  ///
  final AutovalidateMode autovalidateMode;

  /// Determines whether or not to show the
  /// row that shows which requirements have been met
  ///
  final bool showValidationRow;

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
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          widget.showValidationRow
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "8 characters",
                      style: TextStyle(
                        decoration: hasEightCharacters
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    Text(
                      "A - Z",
                      style: TextStyle(
                        decoration: hasCapitalLetter
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    Text(
                      "a - z",
                      style: TextStyle(
                        decoration: hasSmallCapsLetter
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                    Text(
                      "0 - 9",
                      style: TextStyle(
                        decoration:
                            hasADigit ? TextDecoration.lineThrough : null,
                      ),
                    ),
                    Text(
                      "Special Character",
                      style: TextStyle(
                        decoration: hasASpecialCharacter
                            ? TextDecoration.lineThrough
                            : null,
                      ),
                    ),
                  ],
                )
              : SizedBox.shrink(),
          TextFormField(
            controller: widget.controller,
            autovalidateMode: widget.autovalidateMode,
            validator: (String? password) {
              if (password!.isEmpty) {
                return "Password is required!";
              }

              if (!LocalRegex.isValidPassword(password)) {
                return "Password does not meet requirements!";
              }
            },
          ),
        ],
      ),
    );
  }
}
