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
