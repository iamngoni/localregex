/// isValid
///
/// Check if the given [value] matches the given RegExp [source].
bool isValid(String value, RegExp source) {
  final testValue = value.replaceAll(RegExp(r'\s+'), '');
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
