// Copyright (c) 2022, ModestNerd Developers
// https://modestnerd.co
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

/// Enum class for ID format type. This is meant to allow devs to pick
/// the ID number format that they want and is specific to their needs.
///
/// Usage:
/// ```dart
/// IdFormatType.proper
/// IdFormatType.noSpace
/// ```
enum IdFormatType {
  /// **proper**
  ///
  /// This is the basic and most correct ID number format as seen on the
  /// identification cards issued by the government.
  /// Will also be used as the default for any usage within the package.
  proper,

  /// **noSpace**
  ///
  /// This should be used when one wants an ID number without spaces e.g.
  /// 11223344K55
  noSpace;
}
