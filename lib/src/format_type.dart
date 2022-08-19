// Copyright (c) 2022, ModestNerd Developers
// https://modestnerd.co
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

/// FormatType
enum FormatType {
  /// countryCode
  ///
  /// The country code of the number using 263 format.
  countryCode('263'),

  /// countryCodePlus
  ///
  /// The country code of the number using +263 format.
  countryCodePlus('+263'),

  /// regular
  ///
  /// The number using 07 format.
  regular('07');

  /// FormatType
  const FormatType(this.type);

  /// type
  final String type;
}
