// Copyright (c) 2022, ModestNerd Developers
// https://modestnerd.co
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

part of 'localregex.dart';

/// RegexExtensionForStrings
///
/// Extension methods for the [String] class.
extension RegexExtensionForStrings on String {
  /// clean
  ///
  /// Removes all non-numeric characters from the string.
  String get clean => replaceAll(RegExp(r'\s+'), '');

  /// lastCharacters
  ///
  /// Returns the last [n] characters of the string.
  String lastCharacters(int n) => substring(length - n);
}

/// RegexExtensionForNumbers
///
/// Extension methods for the [String] class.
extension RegexExtensionForNumbers on String {
  /// formatNumber
  ///
  /// Returns string in the requested format.
  /// @throws [LocalRegexException] if the phone number is invalid.
  ///
  /// [cleanNumber]
  ///
  /// some phones autoformat contacts
  /// if true: strip all non digit chars from a phone number
  ///
  /// e.g (077) 612-3098 -> 0776123098
  ///     (024) 212-3098 -> 0242123098
  String? formatNumber({
    required FormatType formatType,
    bool cleanNumber = true,
  }) {
    String? number;
    final currentNumber = cleanNumber ? this.cleanNumber : this;

    if (LocalRegex.isZimMobile(currentNumber) ||
        LocalRegex.isZimVoip(currentNumber) ||
        LocalRegex.isZimLandline(currentNumber)) {
      switch (formatType) {
        case FormatType.countryCode:
          number = countryCodeFormat(currentNumber);
          break;
        case FormatType.countryCodePlus:
          number = countryCodePlusFormat(currentNumber);
          break;
        case FormatType.regular:
          number = regularFormat(currentNumber);
          break;
      }
    }

    // failed to format, invalid
    else {
      throw LocalRegexException('Phone number is not valid!');
    }

    return number;
  }

  /// {@template cleanNumber}
  /// clean number
  ///
  /// some phones autoformat contacts,
  ///
  /// this strips all non digit chars from a phone number
  ///
  /// e.g (077) 612-3098 -> 0776123098
  /// {@endtemplate}
  String get cleanNumber => replaceAll(RegExp(r'(\D)*'), '');
}

/// RegexExtensionForID
///
/// Extension methods for the [String] class.
extension RegexExtensionForID on String {
  /// formatID
  ///
  /// Returns string in the requested format.
  /// @throws [LocalRegexException] if the national id is invalid.
  String? formatID({IdFormatType formatType = IdFormatType.proper}) {
    late String id;
    if (LocalRegex.isZimID(this)) {
      final idWithNoSpaces = clean.replaceAll(RegExp('[^A-Z0-9]'), '');
      final idPrefix = idWithNoSpaces.substring(0, 2);
      final idSuffix = idWithNoSpaces.lastCharacters(3);
      final properIdSuffix = "${idSuffix.split("")[0]} ${idSuffix.split("")[1]}"
          "${idSuffix.split("")[2]}";
      final idBody = idWithNoSpaces
          .replaceFirst(RegExp('[0-9]{2}'), '')
          .replaceFirst(RegExp('[A-Za-z][0-9]{2}'), '')
          .trim();

      switch (formatType) {
        case IdFormatType.proper:
          id = '$idPrefix-$idBody $properIdSuffix';
          break;
        case IdFormatType.noSpace:
          id = '$idPrefix$idBody$properIdSuffix'.clean;
          break;
      }
    } else {
      throw LocalRegexException('National ID is not valid');
    }

    return id.toUpperCase();
  }
}

/// RegexExtensionForLocalSchools
///
/// Extension methods for the [LocalSchools] enum.
///
extension StudentIDRegexExtension on LocalSchools {
  static final Map<void, RegExp> _schools = {
    LocalSchools.hit: LocalRegex._schoolHit,
    LocalSchools.telone: LocalRegex._schoolTelone,
    LocalSchools.uz: LocalRegex._schoolUz,
    LocalSchools.msu: LocalRegex._schoolMsu,
  };

  /// isStudent
  ///
  /// Checks if the given student ID is valid.
  ///
  bool isStudent(String studentId) => isValid(studentId, _schools[this]!);
}
