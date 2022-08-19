// ignore_for_file: prefer_const_constructors
import 'package:localregex/localregex.dart';
import 'package:test/test.dart';

void main() {
  group('LocalRegex', () {
    group('Emails', () {
      test('@co.zw', () {
        final isValid = LocalRegex.isEmail('social@freshinabox.co.zw');
        expect(isValid, true);
      });

      test('@gmail.com', () {
        final isValid = LocalRegex.isEmail('imngonii@gmail.com');
        expect(isValid, true);
      });
    });

    group('+263 Mobile Numbers', () {
      test('+26371 -> Netone Mobile Number', () {
        final isValid = LocalRegex.isNetone('+263713700601');
        expect(isValid, true);
      });

      test('+26373 -> Telecel Mobile Number', () {
        final isValid = LocalRegex.isTelecel('+263733220033');
        expect(isValid, true);
      });

      test('+26377 -> Econet Mobile Number', () {
        final isValid = LocalRegex.isEconet('+263777213388');
        // Assert
        expect(isValid, true);
      });

      test('+26378 -> Econet Mobile Number', () {
        final isValid = LocalRegex.isEconet('+263782213388');
        expect(isValid, true);
      });
    });
  });
}
