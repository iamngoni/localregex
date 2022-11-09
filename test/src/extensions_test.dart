import 'package:localregex/src/extensions.dart';
import 'package:localregex/src/format_type.dart';
import 'package:test/test.dart';

void main() {
  group('Extensions Test', () {
    test('countryCode', () {
      final mobileNumber =
          '0777213388'.formatNumber(formatType: FormatType.countryCode);
      expect(mobileNumber, '263777213388');
    });

    test('countryCodePlus', () {
      final mobileNumber =
          '0777213388'.formatNumber(formatType: FormatType.countryCodePlus);
      expect(mobileNumber, '+263777213388');
    });

    test('regular', () {
      final mobileNumber =
          '+263777213388'.formatNumber(formatType: FormatType.regular);
      expect(mobileNumber, '0777213388');
    });
  });

  test('Clean String', () {
    final cleanString = '  77213388  '.clean;
    expect(cleanString, '77213388');
  });

  test('Format National ID', () {
    final id = '75511218 K44'.formatID();
    expect(id, '75-511218 K 44');
  });

  test('Format National ID', () {
    final id = '75-511218 K44'.formatID();
    expect(id, '75-511218 K 44');
  });

  test('Format National ID', () {
    final id = '75511218K44'.formatID();
    expect(id, '75-511218 K 44');
  });
}
