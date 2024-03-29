// Copyright (c) 2022, ModestNerd Developers
// https://modestnerd.co
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

part of 'localregex.dart';

/// Enum class for format type. This is meant to allow devs to pick
/// the phone number format that they want and is specific to their needs.
///
/// Usage:
/// ```dart
/// FormatType.countryCode
/// FormatType.countryCodePlus
/// FormatType.regular
/// ```
enum FormatType {
  /// **countryCode**
  ///
  /// The country code of the number using 263 format.
  countryCode,

  /// **countryCodePlus**
  ///
  /// The country code of the number using +263 format.
  countryCodePlus,

  /// **regular**
  ///
  /// The number using 07 or 0xx format .
  regular;
}
