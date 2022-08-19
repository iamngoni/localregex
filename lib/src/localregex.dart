import 'package:localregex/src/utils.dart';

/// {@template localregex}
/// LocalRegex is a regular expression library that supports locales.
/// {@endtemplate}
class LocalRegex {
  static final RegExp _emailAddress = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+(.[a-zA-Z]+)*",
  );

  static final RegExp _econet = RegExp(r'(?:\+?263|0)(77|78)\d{7}$');

  static final RegExp _netone = RegExp(r'(?:\+?263|0)(71)\d{7}$');

  static final RegExp _telecel = RegExp(r'(?:\+?263|0)(73)\d{7}$');

  /// isEmail
  ///
  /// Checks if given email address is valid.
  static bool isEmail(String value) => isValid(value, _emailAddress);

  /// isNetone
  ///
  /// Checks if given number is a valid Netone number.
  static bool isNetone(String value) => isValid(value, _netone);

  /// isTelecel
  ///
  /// Checks if given number is a valid Telecel number.
  static bool isTelecel(String value) => isValid(value, _telecel);

  /// isEconet
  ///
  /// Checks if given number is a valid Econet number.
  static bool isEconet(String value) => isValid(value, _econet);
}
