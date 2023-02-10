import 'package:localregex/localregex.dart';
import 'package:test/test.dart';

void main() {
  group('LocalRegexException', () {
    test('is thrown', () {
      expect(
        () => '077721338'.formatNumber(formatType: FormatType.countryCode),
        throwsA(isA<LocalRegexException>()),
      );
    });

    test('message is correct', () {
      expect(
        () => '077721338'.formatNumber(formatType: FormatType.countryCode),
        throwsA(
          isA<LocalRegexException>().having(
            (error) => error.message,
            'message',
            'Phone number is not valid!',
          ),
        ),
      );
    });
  });
}
