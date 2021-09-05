library localregex;

import 'package:localregex/format-types.dart';

class LocalRegex {
  /// LocalRegex
  ///
  /// [LocalRegex] is a regex package developed by Ngonidzashe Mangudya
  final RegExp _emailAddress = new RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+(.[a-zA-Z]+)*");
  final RegExp _econet = RegExp(r'(?:\+?263|0)(77|78)[0-9]{7}$');
  final RegExp _netone = RegExp(r'(?:\+?263|0)(71)[0-9]{7}$');
  final RegExp _telecel = RegExp(r'(?:\+?263|0)(73)[0-9]{7}$');
  final RegExp _nationalId =
      RegExp(r'^([0-9]{2})(-|\s)([0-9]{6,7})(\s)([A-Z]{1})(\s)*([0-9]{2})$');
  final RegExp _numberPlate = RegExp(r'^[A-Z]{3}(-|\s)[0-9]{4}$');
  final RegExp _passportNumber = RegExp(r'^[A-Z]{2}[0-9]{6}$');
  final RegExp _driversLicence = RegExp(r'\d{5}[a-zA-Z]{2}');

  /// Match full string
  bool _isValid(String value, RegExp source) {
    try {
      final matches = source.allMatches(value);
      for (Match match in matches) {
        if (match.start == 0 && match.end == value.length) {
          return true;
        }
      }
      return false;
    } catch (e) {
      assert(false);
      return true;
    }
  }

  /// Checks if an email address is valid
  bool isEmail(String value) => _isValid(value, _emailAddress);

  /// Checks if a string is a valid Netone mobile number
  bool isNetone(String value) =>
      _isValid(value.replaceAll(RegExp('\\s+'), ""), _netone);

  /// Checks if a string is a valid Telecel mobile number
  bool isTelecel(String value) =>
      _isValid(value.replaceAll(RegExp('\\s+'), ""), _telecel);

  /// Checks if a string is a valid Econet mobile number
  bool isEconet(String value) =>
      _isValid(value.replaceAll(RegExp('\\s+'), ""), _econet);

  /// Checks if a string is a valid Zimbabwean mobile number registered under the top 3 mobile network providers
  bool isZwMobile(String value) =>
      this.isEconet(value) || this.isNetone(value) || this.isTelecel(value);

  /// Checks if a string is a valid National ID number for Zimbabwe
  bool isZimbabwean(String value) => _isValid(value, _nationalId);

  /// Checks if a string is a valid Passport number for Zimbabwe
  bool isZwPassport(String value) => _isValid(value, _passportNumber);

  /// Checks if a string is a valid Vehicle Number plate for Zimbabwe
  bool isZwNumberPlate(String value) => _isValid(value, _numberPlate);

  /// Checks if a string is a valid Driver's Licence for Zimbabwe
  bool isZwDriversLicence(String value) => _isValid(value, _driversLicence);

  /// Checks if mobile number is a valid Zimbabwean mobile number (Econet, Netone & Telecel) and returns a formatted version
  String? formatIfIsZimbabwe(
      {required String value, required FormatTypes type}) {
    String? _number;
    if (this.isZwMobile(value)) {
      if (type == FormatTypes.common) {
        _number = _formatCommon(value);
      } else if (type == FormatTypes.commonPlus) {
        _number = _formatCommonPlus(value);
      } else if (type == FormatTypes.regular) {
        _number = _formatRegular(value);
      }
    } else {
      throw Exception("Mobile number is not valid");
    }

    return _number;
  }

  /// Format to 263
  String _formatCommon(String number) {
    if (number.length < 9) {
      throw Exception("Mobile number length cannot be less than 9");
    }
    String nineLong = number.substring(number.length - 9);
    return "263${nineLong.replaceAll(new RegExp(r"\s+"), "")}";
  }

  /// Format to +263
  String _formatCommonPlus(String number) {
    if (number.length < 9) {
      throw Exception("Mobile number length cannot be less than 9");
    }

    String nineLong = number.substring(number.length - 9);
    return "+263${nineLong.replaceAll(new RegExp(r"\s+"), "")}";
  }

  /// Format to 07
  String _formatRegular(String number) {
    if (number.length < 9) {
      throw Exception("Mobile number length cannot be less than 9");
    }

    String nineLong = number.substring(number.length - 9);
    return "0${nineLong.replaceAll(new RegExp(r"\s+"), "")}";
  }
}
