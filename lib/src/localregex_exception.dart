// Copyright (c) 2022, ModestNerd Developers
// https://modestnerd.co
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

/// LocalRegexException
///
/// This class is used to represent exceptions that occur during the usage of
/// the LocalRegex library.
class LocalRegexException implements Exception {
  /// LocalRegexException
  ///
  /// Creates a new instance of the [LocalRegexException] class.
  LocalRegexException(this.message);

  /// message
  ///
  /// The message of the exception.
  final String message;
}
