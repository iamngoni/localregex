import 'package:localregex/localregex.dart';
import 'package:test/test.dart';

void main() {
  test('LocalRegexException', () {
    expect(
      () => '077721338'.formatNumber(formatType: FormatType.countryCode),
      throwsA(const TypeMatcher<LocalRegexException>()),
    );
  });
}
