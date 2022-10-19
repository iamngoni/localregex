// Copyright (c) 2022, ModestNerd Developers
// https://modestnerd.co
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:localregex/src/format_type.dart';
import 'package:localregex/src/localregex.dart';
import 'package:localregex/src/localregex_exception.dart';
import 'package:localregex/src/utils.dart';

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
  /// @throws [LocalRegexException] if the mobile number is invalid.
  String? formatNumber(FormatType type) {
    String? number;
    if (LocalRegex.isZimMobile(this) || LocalRegex.isZimVoip(this)) {
      if (type == FormatType.countryCode) {
        number = countryCodeFormat(this);
      } else if (type == FormatType.countryCodePlus) {
        number = countryCodePlusFormat(this);
      } else if (type == FormatType.regular) {
        number = regularFormat(this);
      }
    } else {
      throw LocalRegexException('Mobile number is not valid');
    }

    return number;
  }
}

/// RegexExtensionForID
///
/// Extension methods for the [String] class.
extension RegexExtensionForID on String {
  /// formatID
  ///
  /// Returns string in the requested format.
  /// @throws [LocalRegexException] if the national id is invalid.
  String? formatID() {
    late String id;
    if (LocalRegex.isZimID(this)) {
      final idWithNoSpaces = clean.replaceAll(RegExp('[^A-Z0-9]'), '');
      final idPrefix = idWithNoSpaces.substring(0, 2);
      final idSuffix = idWithNoSpaces.lastCharacters(3);
      final properIdSuffix =
          '${idSuffix.split('')[0]} ${idSuffix.split('')[1]}${idSuffix.split('')[2]}';
      final idBody = idWithNoSpaces
          .replaceAll(idPrefix, '')
          .replaceAll(idSuffix, '')
          .trim();
      id = '$idPrefix-$idBody $properIdSuffix';
    } else {
      throw LocalRegexException('National ID is not valid');
    }

    return id;
  }
}
