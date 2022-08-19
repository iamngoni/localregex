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

    group('Mobile Numbers', () {
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

        test('+26378 -> Econet Mobile Number Alt', () {
          final isValid = LocalRegex.isEconet('+263782213388');
          expect(isValid, true);
        });
      });

      group('263 Mobile Numbers', () {
        test('27371 -> Netone Mobile Number', () {
          final isValid = LocalRegex.isNetone('263713700601');
          expect(isValid, true);
        });
        test('26373', () {
          final isValid = LocalRegex.isTelecel('263733220033');
          expect(isValid, true);
        });

        test('26377 -> Econet Mobile Number', () {
          final isValid = LocalRegex.isEconet('263777213388');
          expect(isValid, true);
        });

        test('26378 -> Econet Mobile Number Alt', () {
          final isValid = LocalRegex.isEconet('263782213388');
          expect(isValid, true);
        });
      });

      group('07 Mobile Numbers', () {
        test('071 -> Netone Mobile Number', () {
          final isValid = LocalRegex.isNetone('0713700601');
          expect(isValid, true);
        });

        test('073 -> Telecel Mobile Number', () {
          final isValid = LocalRegex.isTelecel('0733220033');
          expect(isValid, true);
        });

        test('077 -> Econet Mobile Number', () {
          final isValid = LocalRegex.isEconet('0777213388');
          expect(isValid, true);
        });

        test('078 -> Econet Mobile Number', () {
          final isValid = LocalRegex.isEconet('0782213388');
          expect(isValid, true);
        });
      });

      test('Is A Zimbabwean Mobile Number', () {
        bool isValid;

        isValid = LocalRegex.isZimMobile('0777213388');
        expect(isValid, true);
        isValid = LocalRegex.isZimMobile('+263777213388');
        expect(isValid, true);
        isValid = LocalRegex.isZimMobile('0713700601');
        expect(isValid, true);
        isValid = LocalRegex.isZimMobile('+263713700601');
        expect(isValid, true);
        isValid = LocalRegex.isZimMobile('0733220033');
        expect(isValid, true);
        isValid = LocalRegex.isZimMobile('+263733220033');
        expect(isValid, true);
        isValid = LocalRegex.isZimMobile('0782213388');
        expect(isValid, true);
        isValid = LocalRegex.isZimMobile('+263782213388');
        expect(isValid, true);
        isValid = LocalRegex.isZimMobile('263777213388');
        expect(isValid, true);
        isValid = LocalRegex.isZimMobile('263782213388');
        expect(isValid, true);
        isValid = LocalRegex.isZimMobile('263713700601');
        expect(isValid, true);
        isValid = LocalRegex.isZimMobile('263733220033');
        expect(isValid, true);
      });
    });

    group('Identity', () {
      test("Driver's License", () {
        final isValid = LocalRegex.isZimDriversLicence('98336DM');
        expect(isValid, true);
      });

      test('Passport Number', () {
        final isValid = LocalRegex.isZimPassport('FN633423');
        expect(isValid, true);
      });

      test('Vehicle Number Plate', () {
        final isValid = LocalRegex.isZimNumberPlate('ADW 4746');
        expect(isValid, true);
      });

      group('National Identity Number', () {
        test('Without Space', () {
          final isValid = LocalRegex.isZimID('75-511218 K44');
          expect(isValid, true);
        });

        test('With Spaces', () {
          final isValid = LocalRegex.isZimID('75 511218 K 44');
          expect(isValid, true);
        });

        test('With 7 characters', () {
          final isValid = LocalRegex.isZimID('75 5112188 K44');
          expect(isValid, true);
        });

        test('With 7 characters and no space', () {
          final isValid = LocalRegex.isZimID('75-5112188 K44');
          expect(isValid, true);
        });
      });
    });
  });
}
