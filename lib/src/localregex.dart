// Copyright (c) 2022, ModestNerd Developers
// https://modestnerd.co
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'utils.dart';

/// LocalRegex
///
/// LocalRegex is a regular expression library that supports locales.
class LocalRegex {
  static final RegExp _emailAddress = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+(.[a-zA-Z]+)*",
  );

  // Major Mobile Network Providers
  static final RegExp _econet = RegExp(r'(?:\+?263|0)(77|78)\d{7}$');
  static final RegExp _netone = RegExp(r'(?:\+?263|0)(71)\d{7}$');
  static final RegExp _telecel = RegExp(r'(?:\+?263|0)(73)\d{7}$');

  // Identity Verification
  static final RegExp _nationalId =
      RegExp(r'^(\d{2})(-|\s*)(\d{6,7})(\s)*([A-Z]{1})(\s)*(\d{2})$');
  static final RegExp _numberPlate = RegExp(r'^[A-Z]{3}(-|\s*)\d{4}$');
  static final RegExp _passportNumber = RegExp(r'^[A-Z]{2}\d{6}$');
  static final RegExp _driversLicence = RegExp(r'\d{5}[a-zA-Z]{2}');

  // Passwords
  static final RegExp _password = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#\$&*~^%()+=|]).{8,}$',
  );

  // Mobile Numbers
  static final RegExp _extraMobile = RegExp(r'^([+]\d{2})?\d{10}$');

  // Urls
  static final RegExp _url = RegExp(
    r'https?:\/\/(www\.)?[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
  );

  // Major VoIP Providers in Zimbabwe
  static final RegExp _africom = RegExp(r'(?:\+?263|0)(8644)\d{6}$');
  static final RegExp _datemutande = RegExp(r'(?:\+?263|0)(8612)\d{6}$');
  static final RegExp _liquid = RegExp(r'(?:\+?263|0)(8677)\d{6}$');
  static final RegExp _powertel = RegExp(r'(?:\+?263|0)(8611)\d{6}$');
  static final RegExp _telco = RegExp(r'(?:\+?263|0)(8683)\d{6}$');
  static final RegExp _telone = RegExp(r'(?:\+?263|0)(8688)\d{6}$');
  static final RegExp _zarnet = RegExp(r'(?:\+?263|0)(8622)\d{6}$');

  // Dates
  static final RegExp _date = RegExp(
    r'^(19|20)\d\d[- /.](0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])$',
  );

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

  /// isZimMobile
  ///
  /// Checks if given number is a valid Zim Mobile number.
  static bool isZimMobile(String value) =>
      isEconet(value) || isNetone(value) || isTelecel(value);

  /// isAfricom
  ///
  /// Checks if given number is a valid Africom number.
  static bool isAfricom(String value) => isValid(value, _africom);

  /// isDandemutande
  ///
  /// Checks if given number is a valid Dandemutande number.
  static bool isDandemutande(String value) => isValid(value, _datemutande);

  /// isLiquid
  ///
  /// Checks if given number is a valid Liquid number.
  static bool isLiquid(String value) => isValid(value, _liquid);

  /// isPowertel
  ///
  /// Checks if given number is a valid Powertel number.
  static bool isPowertel(String value) => isValid(value, _powertel);

  /// isTelco
  ///
  /// Checks if given number is a valid Telco number.
  static bool isTelco(String value) => isValid(value, _telco);

  /// isTelone
  ///
  /// Checks if given number is a valid Telone number.
  static bool isTelone(String value) => isValid(value, _telone);

  /// isZarnet
  ///
  /// Checks if given number is a valid Zarnet number.
  static bool isZarnet(String value) => isValid(value, _zarnet);

  /// isZimVoip
  ///
  /// Checks if given number is a valid Zim VoIP number.
  static bool isZimVoip(String value) =>
      isAfricom(value) ||
      isDandemutande(value) ||
      isLiquid(value) ||
      isPowertel(value) ||
      isTelco(value) ||
      isTelone(value) ||
      isZarnet(value);

  /// isZimID
  ///
  /// Checks if given string is a valid Zim ID number.
  static bool isZimID(String value) => isValid(value, _nationalId);

  /// isZimPassport
  ///
  /// Checks if given string is a valid Zim Passport number.
  static bool isZimPassport(String value) => isValid(value, _passportNumber);

  /// isZimNumberPlate
  ///
  /// Checks if given string is a valid Zim Vehicle Number Plate number.
  static bool isZimNumberPlate(String value) => isValid(value, _numberPlate);

  /// isZimDriversLicence
  ///
  /// Checks if given string is a valid Zim Drivers Licence number.
  static bool isZimDriversLicence(String value) =>
      isValid(value, _driversLicence);

  /// isPassword
  ///
  /// Checks if given string is a valid password.
  static bool isPassword(String value) => isValid(value, _password);

  /// isMobileNumber
  ///
  /// Checks if given string is a valid mobile number.
  /// @recommended use [isZimMobile] instead.
  static bool isValidMobile(String value) => isValid(value, _extraMobile);

  /// isUrl
  ///
  /// Checks if given string is a valid url.
  static bool isUrl(String value) => isValid(value, _url);

  /// isDate
  ///
  /// Checks if given string is a valid date.
  static bool isDate(String value) => isValid(value, _date);
}
