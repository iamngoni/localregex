// Copyright (c) 2022, ModestNerd Developers
// https://modestnerd.co
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'extensions.dart';
import 'localregex_exception.dart';

/// isValid
///
/// Check if the given [value] matches the given RegExp [source].
bool isValid(String value, RegExp source) {
  final testValue = value.clean;
  try {
    final matches = source.allMatches(testValue);
    for (final Match match in matches) {
      if (match.start == 0 && match.end == testValue.length) {
        return true;
      }
    }
    return false;
  } catch (e) {
    assert(false, e.toString());
    return true;
  }
}

/// countryCodeFormat
///
/// Returns the phone number with country code format 263.
/// @throws [LocalRegexException] if the given [number] is not a valid number.
String countryCodeFormat(String number) {
  if (number.length < 9) {
    throw LocalRegexException('Phone number length cannot be less than 9');
  }
  final phoneNumber = number.substring(number.length - 9);
  return '263${phoneNumber.clean}';
}

/// countryCodePlusFormat
///
/// Returns the phone number with country code format +263.
/// @throws [LocalRegexException] if the given [number] is not a valid number.
String countryCodePlusFormat(String number) {
  if (number.length < 9) {
    throw LocalRegexException('Phone number length cannot be less than 9');
  }

  final phoneNumber = number.substring(number.length - 9);
  return '+263${phoneNumber.clean}';
}

/// regularFormat
///
/// Returns the phone number with regular format 07.
/// @throws [LocalRegexException] if the given [number] is not a valid number.
String regularFormat(String number) {
  if (number.length < 9) {
    throw LocalRegexException('Phone number length cannot be less than 9');
  }

  final phoneNumber = number.substring(number.length - 9);
  return '0${phoneNumber.clean}';
}
