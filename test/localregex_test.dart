import 'package:flutter_test/flutter_test.dart';
import 'package:localregex/localregex.dart';
import 'package:localregex/format_types.dart';

void main() {
  test('Validate email address', () {
    // Act
    bool isValid = LocalRegex.isEmail("social@freshinabox.co.zw");
    // Assert
    expect(isValid, true);
  });

  test('Validate email address', () {
    // Act
    bool isValid = LocalRegex.isEmail("imngonii@gmail.com");
    // Assert
    expect(isValid, true);
  });

  group("Test +263 mobile numbers", () {
    test(":Validate netone number with +26371", () {
      // Act
      bool isValid = LocalRegex.isNetone("+263713700601");
      // Assert
      expect(isValid, true);
    });
    test(":Validate telecel number with +26373", () {
      // Act
      bool isValid = LocalRegex.isTelecel("+263733220033");
      // Assert
      expect(isValid, true);
    });

    test(":Validate econet number +26377", () {
      // Act
      bool isValid = LocalRegex.isEconet("+263777213388");
      // Assert
      expect(isValid, true);
    });

    test(":Validate econet number +26378", () {
      // Act
      bool isValid = LocalRegex.isEconet("+263782213388");
      // Assert
      expect(isValid, true);
    });
  });

  group("Test 263 mobile numbers", () {
    test(":Validate netone number", () {
      // Act
      bool isValid = LocalRegex.isNetone("263713700601");
      // Assert
      expect(isValid, true);
    });
    test(":Validate telecel number", () {
      // Act
      bool isValid = LocalRegex.isTelecel("263733220033");
      // Assert
      expect(isValid, true);
    });

    test(":Validate econet number 26377", () {
      // Act
      bool isValid = LocalRegex.isEconet("263777213388");
      // Assert
      expect(isValid, true);
    });

    test(":Validate econet number 26378", () {
      // Act
      bool isValid = LocalRegex.isEconet("263782213388");
      // Assert
      expect(isValid, true);
    });
  });

  group("Test 07 mobile numbers", () {
    test(":Validate netone number", () {
      // Act
      bool isValid = LocalRegex.isNetone("0713700601");
      // Assert
      expect(isValid, true);
    });
    test(":Validate telecel number", () {
      // Act
      bool isValid = LocalRegex.isTelecel("0733220033");
      // Assert
      expect(isValid, true);
    });

    test(":Validate econet number 077", () {
      // Act
      bool isValid = LocalRegex.isEconet("0777213388");
      // Assert
      expect(isValid, true);
    });

    test(":Validate econet number 078", () {
      // Act
      bool isValid = LocalRegex.isEconet("0782213388");
      // Assert
      expect(isValid, true);
    });
  });

  test("Validate driver's license number", () {
    // Act
    bool isValid = LocalRegex.isValidZimDriversLicence("98336DM");
    // Assert
    expect(isValid, true);
  });

  test("Validate passport number", () {
    // Act
    bool isValid = LocalRegex.isValidZimPassport("FN633423");
    // Assert
    expect(isValid, true);
  });

  test("Validate number plate", () {
    // Act
    bool isValid = LocalRegex.isValidZimVehicleNumberPlate("ADW 4746");
    // Assert
    expect(isValid, true);
  });

  group("Test national id", () {
    test(":Validate national id without a space", () {
      // Act
      bool isValid = LocalRegex.isValidZimID("75-511218 K44");
      // Assert
      expect(isValid, true);
    });
    test(":Validate national id with a space", () {
      // Act
      bool isValid = LocalRegex.isValidZimID("75 511218 K 44");
      // Assert
      expect(isValid, true);
    });
    test(":Validate national id with 7 numbers", () {
      // Act
      bool isValid = LocalRegex.isValidZimID("75 5112188 K44");
      //Assert
      expect(isValid, true);
    });
  });

  group("Testing if mobile numbers belongs to Econet or Netone or Telecel", () {
    test(":Validate mobile numbers", () {
      bool isValid;

      isValid = LocalRegex.isValidZimMobile("0777213388");
      expect(isValid, true);
      isValid = LocalRegex.isValidZimMobile("+263777213388");
      expect(isValid, true);
      isValid = LocalRegex.isValidZimMobile("0713700601");
      expect(isValid, true);
      isValid = LocalRegex.isValidZimMobile("+263713700601");
      expect(isValid, true);
      isValid = LocalRegex.isValidZimMobile("0733220033");
      expect(isValid, true);
      isValid = LocalRegex.isValidZimMobile("+263733220033");
      expect(isValid, true);
      isValid = LocalRegex.isValidZimMobile("0782213388");
      expect(isValid, true);
      isValid = LocalRegex.isValidZimMobile("+263782213388");
      expect(isValid, true);
      isValid = LocalRegex.isValidZimMobile("263777213388");
      expect(isValid, true);
      isValid = LocalRegex.isValidZimMobile("263782213388");
      expect(isValid, true);
      isValid = LocalRegex.isValidZimMobile("263713700601");
      expect(isValid, true);
      isValid = LocalRegex.isValidZimMobile("263733220033");
    });
  });

  group("Testing formatting", () {
    test(":is Common (2637) format correct", () {
      String? number = LocalRegex.formatNumber(
        value: '0777213388',
        type: FormatTypes.common,
      );
      expect(number, '263777213388');
    });

    test(":is Common Plus (+2637) format correct", () {
      String? number = LocalRegex.formatNumber(
        value: '263777213388',
        type: FormatTypes.commonPlus,
      );
      expect(number, '+263777213388');
    });

    test(":is Regular (07) format correct", () {
      String? number = LocalRegex.formatNumber(
        value: '+263777213388',
        type: FormatTypes.regular,
      );
      expect(number, '0777213388');
    });
  });

  group("Test numbers with custom/funny formatting here", () {
    test("Validate funny numbers", () {
      bool isValid;

      isValid = LocalRegex.isValidZimMobile("+263 77 7213 388");
      expect(isValid, true);
    });
  });

  group("Test passwords", () {
    test("Validate password with correct password", () {
      bool isValid;
      isValid = LocalRegex.isValidPassword("L0c@lRegex");
      expect(isValid, true);
    });

    test("Validate password with missing number password", () {
      bool isValid;
      isValid = LocalRegex.isValidPassword("Loc@lRegex");
      expect(isValid, false);
    });

    test("Validate password with missing character", () {
      bool isValid;
      isValid = LocalRegex.isValidPassword("L0calRegex");
      expect(isValid, false);
    });

    test("Validate password with no character and no number", () {
      bool isValid;
      isValid = LocalRegex.isValidPassword("LocalRegex");
      expect(isValid, false);
    });
  });

  // group("Test student IDS from Zim universities", () {
  //   test("Harare Institute of Technology", () {
  //     bool isValid;
  //     isValid = LocalRegex.isStudent.(value)
  //   });
  // });
}
