// Copyright (c) 2022, ModestNerd Developers
// https://modestnerd.co
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'dart:math';

part 'extensions.dart';
part 'format_type.dart';
part 'id_format_type.dart';
part 'localregex_exception.dart';
part 'utils.dart';

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

  // Zim landline (Telone at the time of writing)
  static final RegExp _landLine = RegExp(
    r'(?:\+?263|0)(242|24213|24215|24214|242150|2421|27203|272317|27205|272046|27204|2020|2021|2024|20200|26209|26208|262098|25206|252055|25207|25205|66210|66219|66218|66212|66216|66217|662137|672192|672198|672196|672136|6721|67215|67214|61214|61215|612141|612140|6821|68215|682189|68216|652080|6523|65208|6521|65213|392|39234|392380|392366|392360|39230|39245|392323|39235|392308|31231|31233|312337|312370|292|292861|292821|292803|292802|292800|292804|292807|292809|812847|812835|8128|812875|812856|8328|8523|89280|842801|842835|8428|842808|542|54252|542532|542548|54212|5525|55259|552558|552557)\d{3,7}$',
  );

  // Identity Verification
  static final RegExp _nationalId =
      RegExp(r'^(\d{2})(-|\s*)(\d{6,7})(\s)*([A-Za-z])(\s)*(\d{2})$');
  static final RegExp _numberPlate = RegExp(r'^[A-Z]{3}(-|\s*)\d{4}$');
  static final RegExp _passportNumber = RegExp(r'^[A-Z]{2}\d{6}$');
  static final RegExp _driversLicence = RegExp(r'\d{5}[a-zA-Z]{2}');

  // Passwords
  static final RegExp _password = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)(?=.*?[!@#$&*~^%()+=|]).{8,}$',
  );

  // Mobile Numbers
  static final RegExp _extraMobile = RegExp(r'^([+]\d{2})?\d{10}$');

  // Urls
  static final RegExp _url = RegExp(
    r'https?://(www\.)?[-a-zA-Z0-9@:%._+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_+.~#?&/=]*)',
  );

  // Major VoIP Providers in Zimbabwe
  static final RegExp _africom = RegExp(r'(?:\+?263|0)(8644)\d{6}$');
  static final RegExp _datemutande = RegExp(r'(?:\+?263|0)(8612)\d{6}$');
  static final RegExp _liquid = RegExp(r'(?:\+?263|0)(8677)\d{6}$');
  static final RegExp _powertel = RegExp(r'(?:\+?263|0)(8611)\d{6}$');
  static final RegExp _telco = RegExp(r'(?:\+?263|0)(8683)\d{6}$');
  static final RegExp _telone = RegExp(r'(?:\+?263|0)(8688)\d{6}$');
  static final RegExp _zarnet = RegExp(r'(?:\+?263|0)(8622)\d{6}$');

  // Schools
  // telone: T2216313T
  // hit: H180202M
  static final RegExp _schoolHit = RegExp(r'H[0-9]{6}[A-Z]$');
  static final RegExp _schoolTelone = RegExp(r'T[0-9]{7}[A-Z]$');
  static final RegExp _schoolUz = RegExp(r'R[0-9]{6}[A-Z]$');
  static final RegExp _schoolMsu = RegExp(r'R[0-9]{7}[A-Z]$');

  // Utils
  static final RegExp _date = RegExp(
    r'^(?:31([/\-.])(?:0?[13578]|1[02])\1|(?:29|30)([/\-.])(?:0?[13-9]|1[0-2])\2)(?:1[6-9]|[2-9]\d)?\d{2}$|^29([/\-.])0?2\3(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:16|[2468][048]|[3579][26])00)$|^(?:0?[1-9]|1\d|2[0-8])([/\-.])(?:0?[1-9]|1[0-2])\4(?:1[6-9]|[2-9]\d)?\d{2}$',
  );
  static final RegExp _ipAddress = RegExp(
    r'^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$',
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

  /// isZimLandline
  ///
  /// Checks if given number is a valid Zimbabwean landline number registered
  /// under telone as it is currently the only landline provider
  static bool isZimLandline(String value) => isValid(value, _landLine);

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
  static bool isZimVoip(String voipNumber) =>
      isAfricom(voipNumber) ||
      isDandemutande(voipNumber) ||
      isLiquid(voipNumber) ||
      isPowertel(voipNumber) ||
      isTelco(voipNumber) ||
      isTelone(voipNumber) ||
      isZarnet(voipNumber);

  /// isZimID
  ///
  /// Checks if given string is a valid Zim ID number.
  static bool isZimID(String idNumber) => isValid(idNumber, _nationalId);

  /// isZimPassport
  ///
  /// Checks if given string is a valid Zim Passport number.
  static bool isZimPassport(String passportNumber) =>
      isValid(passportNumber, _passportNumber);

  /// isZimNumberPlate
  ///
  /// Checks if given string is a valid Zim Vehicle Number Plate number.
  static bool isZimNumberPlate(String numberPlate) =>
      isValid(numberPlate, _numberPlate);

  /// isZimDriversLicence
  ///
  /// Checks if given string is a valid Zim Drivers Licence number.
  static bool isZimDriversLicence(String licenseNumber) =>
      isValid(licenseNumber, _driversLicence);

  /// isPassword
  ///
  /// Checks if given string is a valid password.
  static bool isPassword(String password) => isValid(password, _password);

  /// isMobileNumber
  ///
  /// Checks if given string is a valid mobile number.
  /// @recommended use [isZimMobile] instead.
  static bool isValidMobile(String mobileNumber) =>
      isValid(mobileNumber, _extraMobile);

  /// isUrl
  ///
  /// Checks if given string is a valid url.
  static bool isUrl(String url) => isValid(url, _url);

  /// isDate
  ///
  /// Checks if given string is a valid date.
  static bool isDate(String date) => isValid(date, _date);

  /// isIpAddress
  ///
  /// Check if given string is an IP Address
  static bool isIpAddress(String ipAddress) => isValid(ipAddress, _ipAddress);

  /// generatePassword
  ///
  /// Generates a random password.
  static String generatePassword({int length = 12}) {
    const String smallChars = 'abcdefghijklmnopqrstuvwxyz';
    const String capChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String numbers = '0123456789';
    const String characters = r'!@#$%^&*()-_=+[]{}|;:",.<>?/~`';

    final Random random = Random.secure();

    // random password should have at least one of each
    final String randomChars = List.generate(
      length,
      (index) => smallChars[random.nextInt(smallChars.length)],
    ).join();

    final String randomCaps = List.generate(
      length,
      (index) => capChars[random.nextInt(capChars.length)],
    ).join();

    final String randomNumbers = List.generate(
      length,
      (index) => numbers[random.nextInt(numbers.length)],
    ).join();

    final String randomSpecialChars = List.generate(
      length,
      (index) => characters[random.nextInt(characters.length)],
    ).join();

    final List<String> passwordList =
        '$randomChars$randomCaps$randomNumbers$randomSpecialChars'.split('')
          ..shuffle();
    final String password = passwordList.join();
    return password.substring(0, length);
  }
}
