/// Collection of common regex patterns

library localregex;

import 'package:localregex/format_types.dart';

class LocalRegex {
  /// LocalRegex
  ///
  /// [LocalRegex] is a regex package developed by Ngonidzashe Mangudya
  static final RegExp _emailAddress = new RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+(.[a-zA-Z]+)*");
  static RegExp _econet = RegExp(r'(?:\+?263|0)(77|78)\d{7}$');
  static RegExp _netone = RegExp(r'(?:\+?263|0)(71)\d{7}$');
  static RegExp _telecel = RegExp(r'(?:\+?263|0)(73)\d{7}$');
  static RegExp _nationalId =
      RegExp(r'^(\d{2})(-|\s)(\d{6,7})(\s)([A-Z]{1})(\s)*(\d{2})$');
  static RegExp _numberPlate = RegExp(r'^[A-Z]{3}(-|\s)\d{4}$');
  static RegExp _passportNumber = RegExp(r'^[A-Z]{2}\d{6}$');
  static RegExp _driversLicence = RegExp(r'\d{5}[a-zA-Z]{2}');
  static RegExp _password = RegExp(
      r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#\$&*~^%()+=|]).{8,}$");
  static RegExp _extraMobile = RegExp(r'^([+]\d{2})?\d{10}$');

      /// Add support for VOIP numbers
  static final RegExp _africom = RegExp(r'(?:\+?263|0)(8644)\d{6}$');
  static final RegExp _datemutande = RegExp(r'(?:\+?263|0)(8612)\d{6}$');
  static final RegExp _liquid = RegExp(r'(?:\+?263|0)(8677)\d{6}$');
  static final RegExp _powertel = RegExp(r'(?:\+?263|0)(8611)\d{6}$');
  static final RegExp _telco = RegExp(r'(?:\+?263|0)(8683)\d{6}$');
  static final RegExp _telone = RegExp(r'(?:\+?263|0)(8688)\d{6}$');
  static final RegExp _zarnet = RegExp(r'(?:\+?263|0)(8622)\d{6}$');

  /// Match full string
  static bool _isValid(String value, RegExp source) {
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
  static bool isEmail(String value) => _isValid(value, _emailAddress);

  /// Checks if a string is a valid Netone mobile number
  static bool isNetone(String value) =>
      _isValid(value.replaceAll(RegExp('\\s+'), ""), _netone);

  /// Checks if a string is a valid Telecel mobile number
  static bool isTelecel(String value) =>
      _isValid(value.replaceAll(RegExp('\\s+'), ""), _telecel);

  /// Checks if a string is a valid Econet mobile number
  static bool isEconet(String value) =>
      _isValid(value.replaceAll(RegExp('\\s+'), ""), _econet);

  /// Checks if a string is a valid Zimbabwean mobile number registered under the top 3 mobile network providers
  static bool isValidZimMobile(String value) =>
      isEconet(value) || isNetone(value) || isTelecel(value);
     
       /// Checks if a string is a valid Africom VOIP number
  static bool isAfricom(String value) => _isValid(value.replaceAll(RegExp('\\s+'), ""), _africom);

    /// Checks if a string is a valid Dandemutande VOIP number
  static bool isDandemutande(String value) =>  _isValid(value.replaceAll(RegExp('\\s+'), ""), _datemutande);

    /// Checks if a string is a valid Liquid VOIP number
  static bool isLiquid(String value) => _isValid(value.replaceAll(RegExp('\\s+'), ""), _liquid);

    /// Checks if a string is a valid Powertel VOIP number
  static bool isPowertel(String value) => _isValid(value.replaceAll(RegExp('\\s+'), ""), _powertel);

    /// Checks if a string is a valid Telco VOIP number
  static bool isTelco(String value) => _isValid(value.replaceAll(RegExp('\\s+'), ""), _telco);

    /// Checks if a string is a valid Telone VOIP number
  static bool isTelone(String value) => _isValid(value.replaceAll(RegExp('\\s+'), ""), _telone);

      /// Checks if a string is a valid Zarnet VOIP number
  static bool isZarnet(String value) => _isValid(value.replaceAll(RegExp('\\s+'), ""), _zarnet);

    /// Checks if a string is a valid Zimbabwean voip number registered under the top 7 voip  providers
  static bool isValidZimVoipNumber(String value) =>
      isAfricom(value) || isDandemutande(value) || isLiquid(value) || isPowertel(value) 
      || isTelco(value) || isTelone(value) || isZarnet(value);


  /// Checks if a string is a valid National ID number for Zimbabwe
  static bool isValidZimID(String value) => _isValid(value, _nationalId);

  /// Checks if a string is a valid Passport number for Zimbabwe
  static bool isValidZimPassport(String value) =>
      _isValid(value, _passportNumber);

  /// Checks if a string is a valid Vehicle Number plate for Zimbabwe
  static bool isValidZimVehicleNumberPlate(String value) =>
      _isValid(value, _numberPlate);

  /// Checks if a string is a valid Driver's Licence for Zimbabwe
  static bool isValidZimDriversLicence(String value) =>
      _isValid(value, _driversLicence);

  /// Validate passwords
  static bool isValidPassword(String value) => _isValid(value, _password);

  /// Validate is mobile number is valid
  /// If you're validate Zim numbers we recommend using [isValidZimMobile]
  static bool isValidMobile(String value) => _isValid(value, _extraMobile);

  /// Checks if mobile number is a valid Zimbabwean mobile number [isEconet] or [isTelecel] or [isNetone] and returns a formatted version
  static String? formatNumber(
      {required String value, required FormatTypes type}) {
    String? _number;
    if (isValidZimMobile(value) || isValidZimVoipNumber(value)) {
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
  static String _formatCommon(String number) {
    if (number.length < 9) {
      throw Exception("Mobile number length cannot be less than 9");
    }
    String nineLong = number.substring(number.length - 9);
    return "263${nineLong.replaceAll(new RegExp(r"\s+"), "")}";
  }

  /// Format to +263
  static String _formatCommonPlus(String number) {
    if (number.length < 9) {
      throw Exception("Mobile number length cannot be less than 9");
    }

    String nineLong = number.substring(number.length - 9);
    return "+263${nineLong.replaceAll(new RegExp(r"\s+"), "")}";
  }

  /// Format to 07
  static String _formatRegular(String number) {
    if (number.length < 9) {
      throw Exception("Mobile number length cannot be less than 9");
    }

    String nineLong = number.substring(number.length - 9);
    return "0${nineLong.replaceAll(new RegExp(r"\s+"), "")}";
  }
}
