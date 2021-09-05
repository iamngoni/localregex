import 'package:flutter_test/flutter_test.dart';
import 'package:localregex/format-types.dart';
import 'package:localregex/localregex.dart';

void main() {
  final localregex = LocalRegex();
  test('Validate email address', () {
    // Act
    bool isValid = localregex.isEmail("social@freshinabox.co.zw");
    // Assert
    expect(isValid, true);
  });

  test('Validate email address', () {
    // Act
    bool isValid = localregex.isEmail("imngonii@gmail.com");
    // Assert
    expect(isValid, true);
  });

  group("Test +263 mobile numbers", () {
    test(":Validate netone number with +26371", () {
      // Act
      bool isValid = localregex.isNetone("+263713700601");
      // Assert
      expect(isValid, true);
    });
    test(":Validate telecel number with +26373", () {
      // Act
      bool isValid = localregex.isTelecel("+263733220033");
      // Assert
      expect(isValid, true);
    });

    test(":Validate econet number +26377", () {
      // Act
      bool isValid = localregex.isEconet("+263777213388");
      // Assert
      expect(isValid, true);
    });

    test(":Validate econet number +26378", () {
      // Act
      bool isValid = localregex.isEconet("+263782213388");
      // Assert
      expect(isValid, true);
    });
  });

  group("Test 263 mobile numbers", () {
    test(":Validate netone number", () {
      // Act
      bool isValid = localregex.isNetone("263713700601");
      // Assert
      expect(isValid, true);
    });
    test(":Validate telecel number", () {
      // Act
      bool isValid = localregex.isTelecel("263733220033");
      // Assert
      expect(isValid, true);
    });

    test(":Validate econet number 26377", () {
      // Act
      bool isValid = localregex.isEconet("263777213388");
      // Assert
      expect(isValid, true);
    });

    test(":Validate econet number 26378", () {
      // Act
      bool isValid = localregex.isEconet("263782213388");
      // Assert
      expect(isValid, true);
    });
  });

  group("Test 07 mobile numbers", () {
    test(":Validate netone number", () {
      // Act
      bool isValid = localregex.isNetone("0713700601");
      // Assert
      expect(isValid, true);
    });
    test(":Validate telecel number", () {
      // Act
      bool isValid = localregex.isTelecel("0733220033");
      // Assert
      expect(isValid, true);
    });

    test(":Validate econet number 077", () {
      // Act
      bool isValid = localregex.isEconet("0777213388");
      // Assert
      expect(isValid, true);
    });

    test(":Validate econet number 078", () {
      // Act
      bool isValid = localregex.isEconet("0782213388");
      // Assert
      expect(isValid, true);
    });
  });

  test("Validate driver's license number", () {
    // Act
    bool isValid = localregex.isZwDriversLicence("98336DM");
    // Assert
    expect(isValid, true);
  });

  test("Validate passport number", () {
    // Act
    bool isValid = localregex.isZwPassport("FN633423");
    // Assert
    expect(isValid, true);
  });

  test("Validate number plate", () {
    // Act
    bool isValid = localregex.isZwNumberPlate("ADW 4746");
    // Assert
    expect(isValid, true);
  });

  group("Test national id", () {
    test(":Validate national id without a space", () {
      // Act
      bool isValid = localregex.isZimbabwean("75-511218 K44");
      // Assert
      expect(isValid, true);
    });
    test(":Validate national id with a space", () {
      // Act
      bool isValid = localregex.isZimbabwean("75 511218 K 44");
      // Assert
      expect(isValid, true);
    });
    test(":Validate national id with 7 numbers", () {
      // Act
      bool isValid = localregex.isZimbabwean("75 5112188 K44");
      //Assert
      expect(isValid, true);
    });
  });

  group("Testing if mobile numbers belongs to Econet or Netone or Telecel", () {
    test(":Validate mobile numbers", () {
      bool isValid;

      isValid = localregex.isZwMobile("0777213388");
      expect(isValid, true);
      isValid = localregex.isZwMobile("+263777213388");
      expect(isValid, true);
      isValid = localregex.isZwMobile("0713700601");
      expect(isValid, true);
      isValid = localregex.isZwMobile("+263713700601");
      expect(isValid, true);
      isValid = localregex.isZwMobile("0733220033");
      expect(isValid, true);
      isValid = localregex.isZwMobile("+263733220033");
      expect(isValid, true);
      isValid = localregex.isZwMobile("0782213388");
      expect(isValid, true);
      isValid = localregex.isZwMobile("+263782213388");
      expect(isValid, true);
      isValid = localregex.isZwMobile("263777213388");
      expect(isValid, true);
      isValid = localregex.isZwMobile("263782213388");
      expect(isValid, true);
      isValid = localregex.isZwMobile("263713700601");
      expect(isValid, true);
      isValid = localregex.isZwMobile("263733220033");
    });
  });

  group("Testing formatting", () {
    test(":is Common (2637) format correct", () {
      String? number = localregex.formatIfIsZimbabwe(
        value: '0777213388',
        type: FormatTypes.common,
      );
      expect(number, '263777213388');
    });

    test(":is Common Plus (+2637) format correct", () {
      String? number = localregex.formatIfIsZimbabwe(
        value: '263777213388',
        type: FormatTypes.commonPlus,
      );
      expect(number, '+263777213388');
    });

    test(":is Regular (07) format correct", () {
      String? number = localregex.formatIfIsZimbabwe(
        value: '+263777213388',
        type: FormatTypes.regular,
      );
      expect(number, '0777213388');
    });
  });

  group("Test numbers with custom/funny formatting here", () {
    test("Validate funny numbers", () {
      bool isValid;

      isValid = localregex.isZwMobile("+263 77 7213 388");
      expect(isValid, true);
    });
  });
}
