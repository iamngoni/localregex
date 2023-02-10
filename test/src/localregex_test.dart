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

      group('Formatting Mobile Numbers', () {
        test('countryCode Format (263)', () {
          final number =
              '0777213388'.formatNumber(formatType: FormatType.countryCode);
          expect(number, '263777213388');
        });

        test('countryCodePlus Format (+263)', () {
          final number = '263777213388'
              .formatNumber(formatType: FormatType.countryCodePlus);
          expect(number, '+263777213388');
        });

        test('regular Format (07)', () {
          final number =
              '+263777213388'.formatNumber(formatType: FormatType.regular);
          expect(number, '0777213388');
        });
      });

      test('Validate Numbers With Funny Formats', () {
        final isValid = LocalRegex.isZimMobile('+263 77 7213 388');
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

        test('With no spaces at all', () {
          final isValid = LocalRegex.isZimID('75511218K44');
          expect(isValid, true);
        });

        test('With 7 characters and no spaces at all', () {
          final isValid = LocalRegex.isZimID('755112188K44');
          expect(isValid, true);
        });
      });
    });

    group('Passwords', () {
      test('Correct Password Format', () {
        final isValid = LocalRegex.isPassword('L0c@lRegex|');
        expect(isValid, true);
      });

      test('With Missing Number', () {
        final isValid = LocalRegex.isPassword('Loc@lRegex');
        expect(isValid, false);
      });

      test('With Missing Character', () {
        final isValid = LocalRegex.isPassword('L0calRegex');
        expect(isValid, false);
      });

      test('No special characters and no numbers', () {
        final isValid = LocalRegex.isPassword('LocalRegex');
        expect(isValid, false);
      });

      test('With No Capital Letter', () {
        final isValid = LocalRegex.isPassword('loca@leg1ex');
        expect(isValid, false);
      });
    });

    group('VoIP Numbers', () {
      group('+263 VOIP Numbers', () {
        test('+2638644 -> Africom VoIP Number', () {
          final isValid = LocalRegex.isAfricom('+2638644105500');
          expect(isValid, true);
        });

        test('+2638612 -> Dandemutande VoIP Number', () {
          final isValid = LocalRegex.isDandemutande('+2638612003000');
          expect(isValid, true);
        });

        test('+2638677 -> Liquid VoIP Number', () {
          final isValid = LocalRegex.isLiquid('+2638677020251');
          expect(isValid, true);
        });

        test('+2638611 -> Powertel VoIP Number', () {
          final isValid = LocalRegex.isPowertel('+2638611208281');
          expect(isValid, true);
        });

        test('+2638683 -> Telco VoIP Number', () {
          final isValid = LocalRegex.isTelco('+2638683000000');
          expect(isValid, true);
        });

        test('+2638622 -> Zarnet VoIP Number', () {
          final isValid = LocalRegex.isZarnet('+2638622009070');
          expect(isValid, true);
        });

        test('+2638688 -> Telone VoIP Number', () {
          final isValid = LocalRegex.isTelone('+2638688003099');
          expect(isValid, true);
        });
      });

      group('263 VOIP Numbers', () {
        test('2638644 -> Africom VoIP Number', () {
          final isValid = LocalRegex.isAfricom('2638644105500');
          expect(isValid, true);
        });

        test('2638612 -> Dandemutande VoIP Number', () {
          final isValid = LocalRegex.isDandemutande('08612 003 000');
          expect(isValid, true);
        });

        test('2638677 -> Liquid VoIP Number', () {
          final isValid = LocalRegex.isLiquid('2638677020251');
          expect(isValid, true);
        });

        test('2638611 -> Powertel VoIP Number', () {
          final isValid = LocalRegex.isPowertel('2638611208281');
          expect(isValid, true);
        });

        test('2638683 -> Telco VoIP Number', () {
          final isValid = LocalRegex.isTelco('2638683000000');
          expect(isValid, true);
        });

        test('2638622 -> Zarnet VoIP Number', () {
          final isValid = LocalRegex.isZarnet('2638622009070');
          expect(isValid, true);
        });

        test('2638688 -> Telone VoIP Number', () {
          final isValid = LocalRegex.isTelone('2638688003099');
          expect(isValid, true);
        });
      });

      group('086 VoIP Numbers', () {
        test('08644 -> Africom VoIP Numbers', () {
          final isValid = LocalRegex.isAfricom('08644105500');
          expect(isValid, true);
        });

        test('08612 -> Dandemutande VoIP Numbers', () {
          final isValid = LocalRegex.isDandemutande('08612 003 000');
          expect(isValid, true);
        });

        test('08677 -> Liquid VoIP Numbers', () {
          final isValid = LocalRegex.isLiquid('08677020251');
          expect(isValid, true);
        });

        test('08611 -> Powertel VoIP Numbers', () {
          final isValid = LocalRegex.isPowertel('08611208281');
          expect(isValid, true);
        });

        test('08683 -> Telco VoIP Numbers', () {
          final isValid = LocalRegex.isTelco('08683000000');
          expect(isValid, true);
        });

        test('08622 -> Zarnet VoIP Numbers', () {
          final isValid = LocalRegex.isZarnet('08622009070');
          expect(isValid, true);
        });

        test('08688 -> Telone VoIP Numbers', () {
          final isValid = LocalRegex.isTelone('08688003099');
          expect(isValid, true);
        });
      });
    });

    group('Landline Numbers', () {
      group('+263 Landline Numbers', () {
        test('+263 -> Valid Landline Number', () {
          final isValid = LocalRegex.isZimLandline('+263242790122');
          expect(isValid, true);
        });

        test('+263 -> InValid Landline Number', () {
          final isNotValid = LocalRegex.isZimLandline('+2632427x0122');
          expect(isNotValid, false);
        });
      });
      group('263 Landline Numbers', () {
        test('263 -> Valid Landline Number', () {
          final isValid = LocalRegex.isZimLandline('263242790122');
          expect(isValid, true);
        });

        test('263 -> InValid Landline Number', () {
          final isNotValid = LocalRegex.isZimLandline('26324%2790122');
          expect(isNotValid, false);
        });
      });
      group('Oxx Landline Numbers', () {
        test('0x -> Valid Landline Number', () {
          final isValid = LocalRegex.isZimLandline('0242790122');
          expect(isValid, true);
        });
        test('0x -> InValid Landline Number', () {
          // O vs 0
          final isNotValid = LocalRegex.isZimLandline('O242790122');
          expect(isNotValid, false);
          // I vs 1
          final isFalse = LocalRegex.isZimLandline('O242790I22');
          expect(isFalse, false);
          // too long to be a valid number
          final tooLong = LocalRegex.isZimLandline('O2427901228');
          expect(tooLong, false);
          // too short to be a valid number
          final tooShort = LocalRegex.isZimLandline('O242790');
          expect(tooShort, false);
        });
      });
    });

    group('URLS', () {
      test('Valid Url', () {
        final isValid = LocalRegex.isUrl('https://www.google.com');
        expect(isValid, true);
      });

      test('Invalid Url', () {
        final isValid = LocalRegex.isUrl('www.helloworld');
        expect(isValid, false);
      });
    });

    group('Dates', () {
      test('With /', () {
        final isValid = LocalRegex.isDate('2022/07/28');
        expect(isValid, true);
      });

      test('With -', () {
        final isValid = LocalRegex.isDate('2022-07-28');
        expect(isValid, true);
      });
    });
  });
}
