import 'package:flutter/material.dart';

class PasswordValidationSection extends StatelessWidget {
  const PasswordValidationSection({
    Key? key,
    required this.hasEightCharacters,
    required this.hasCapitalLetter,
    required this.hasSmallCapsLetter,
    required this.hasADigit,
    required this.hasASpecialCharacter,
  }) : super(key: key);

  final bool hasEightCharacters;
  final bool hasCapitalLetter;
  final bool hasSmallCapsLetter;
  final bool hasADigit;
  final bool hasASpecialCharacter;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "8 characters",
          style: TextStyle(
            decoration: hasEightCharacters ? TextDecoration.lineThrough : null,
          ),
        ),
        Text(
          "A - Z",
          style: TextStyle(
            decoration: hasCapitalLetter ? TextDecoration.lineThrough : null,
          ),
        ),
        Text(
          "a - z",
          style: TextStyle(
            decoration: hasSmallCapsLetter ? TextDecoration.lineThrough : null,
          ),
        ),
        Text(
          "0 - 9",
          style: TextStyle(
            decoration: hasADigit ? TextDecoration.lineThrough : null,
          ),
        ),
        Text(
          "Special Character",
          style: TextStyle(
            decoration:
                hasASpecialCharacter ? TextDecoration.lineThrough : null,
          ),
        ),
      ],
    );
  }
}
