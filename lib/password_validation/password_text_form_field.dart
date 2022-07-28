import 'package:flutter/material.dart';
import 'package:localregex/password_validation/password_validation_section.dart';

import '../localregex.dart';

class PasswordTextFormField extends StatefulWidget {
  PasswordTextFormField({
    Key? key,
    required this.controller,
    this.decoration,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.obscureText = true,
    this.obscuringCharacter = "*",
    this.style,
    this.keyboardType = TextInputType.text,
    this.showValidationRow = true,
    this.overrideValidationRow = false,
    this.customValidationSection,
    this.debugPrintLoud = false,
    this.textColor = Colors.white,
    this.textFontWeight = FontWeight.normal,
    this.textFontSize = 15,
  }) : super(key: key);

  /// The controller required by the password
  /// [TextFormField]
  ///
  final TextEditingController controller;

  /// Input decoration to be used on the password
  /// [TextFormField]
  ///
  final InputDecoration? decoration;

  /// Determines how frequent the password [TextFormField]
  /// should be validated. Defaults to [AutovalidateMode.onUserInteraction]
  ///
  final AutovalidateMode autovalidateMode;

  /// Determines whether or not to hide the password being typed
  /// in by a user. By default this is set to True
  ///
  final bool obscureText;

  /// Character to be used instead of the actual password text
  ///
  final String obscuringCharacter;

  /// TextStyle for the password [TextFormField]
  final TextStyle? style;

  /// Type of keyboard to be shown to the user.
  /// This defaults to [TextInputType.text]
  final TextInputType? keyboardType;

  /// Determines whether or not to show the
  /// row that shows which requirements have been met
  ///
  final bool showValidationRow;

  /// Determines whether or not to use developer's
  /// custom validation section function
  ///
  final bool overrideValidationRow;

  /// Function that returns the widget to show
  /// on the validation section
  ///
  final Function? customValidationSection;

  /// Set whether the controller listener should also
  /// print out the boolean values
  ///
  final bool debugPrintLoud;

  /// Color of the validation text
  ///
  final Color textColor;

  /// Font size of the validation text
  ///
  final double textFontSize;

  /// Font weight of the validation text
  ///
  final FontWeight textFontWeight;

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
    if (widget.overrideValidationRow) {
      if (widget.customValidationSection == null) {
        throw Exception(
            "When overriding the validation row, you should supply the new widget");
      }

      if (!(widget.customValidationSection is Function)) {
        throw Exception(
            "Custom validation section has to extend PasswordValidationSection");
      }
    }

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

      if (widget.debugPrintLoud) {
        debugPrint(
            "Has capital letter: ${widget.controller.text.contains(RegExp(r'[A-Z]'))}");
        debugPrint(
            "Has small letter: ${widget.controller.text.contains(RegExp(r'[a-z]'))}");
        debugPrint(
            "Has digits: ${widget.controller.text.contains(RegExp(r'[0-9]'))}");
        debugPrint(
            "Has special characters: ${widget.controller.text.contains(RegExp(r'[!@#\$&*~^%()+=|]'))}");
        debugPrint(
            "Has at least 8 characters: ${widget.controller.text.length >= 8}");
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          widget.showValidationRow
              ? widget.overrideValidationRow
                  ? widget.customValidationSection!(
                      hasEightCharacters: hasEightCharacters,
                      hasCapitalLetter: hasCapitalLetter,
                      hasSmallCapsLetter: hasSmallCapsLetter,
                      hasADigit: hasADigit,
                      hasASpecialCharacter: hasASpecialCharacter,
                    )
                  : PasswordValidationSection(
                      hasEightCharacters: hasEightCharacters,
                      hasCapitalLetter: hasCapitalLetter,
                      hasSmallCapsLetter: hasSmallCapsLetter,
                      hasADigit: hasADigit,
                      hasASpecialCharacter: hasASpecialCharacter,
                      textColor: widget.textColor,
                      textFontSize: widget.textFontSize,
                      textFontWeight: widget.textFontWeight,
                    )
              : SizedBox.shrink(),
          TextFormField(
            controller: widget.controller,
            decoration: widget.decoration,
            style: widget.style,
            keyboardType: widget.keyboardType,
            autovalidateMode: widget.autovalidateMode,
            obscureText: widget.obscureText,
            obscuringCharacter: widget.obscuringCharacter,
            validator: (String? password) {
              if (password!.isEmpty) {
                return "Password is required!";
              }

              if (!LocalRegex.isValidPassword(password)) {
                return "Password does not meet requirements!";
              }

              return null;
            },
          ),
        ],
      ),
    );
  }
}
