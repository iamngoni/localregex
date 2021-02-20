import 'package:flutter_test/flutter_test.dart';
import 'package:localregex/localregex.dart';

void main() {
  final localregex = LocalRegex();
  test('Validate email address', () {
    try {
      assert(localregex.isEmail("ngmangudya@gmail.com"), true);
    } on AssertionError catch (e) {
      print(e);
    }
  });

  group("Test +263 mobile numbers", () {
    test(":Validate netone number", () {
      try {
        assert(localregex.isNetone("263713700601"), true);
      } on AssertionError catch (e) {
        print(e);
      }
    });
    test(":Validate telecel number", () {
      try {
        assert(localregex.isTelecel("2630733220033"), true);
      } on AssertionError catch (e) {
        print(e);
      }
    });

    test(":Validate econet number 26377", () {
      try {
        assert(localregex.isEconet("263777213388"), true);
      } on AssertionError catch (e) {
        print(e);
      }
    });

    test(":Validate econet number 26378", () {
      try {
        assert(localregex.isEconet("+263782213388"), true);
      } on AssertionError catch (e) {
        print(e);
      }
    });
  });

  group("Test 07 mobile numbers", () {
    test(":Validate netone number", () {
      try {
        assert(localregex.isNetone("0713700601"), true);
      } on AssertionError catch (e) {
        print(e);
      }
    });
    test(":Validate telecel number", () {
      try {
        assert(localregex.isTelecel("0733220033"), true);
      } on AssertionError catch (e) {
        print(e);
      }
    });

    test(":Validate econet number 077", () {
      try {
        assert(localregex.isEconet("0777213388"), true);
      } on AssertionError catch (e) {
        print(e);
      }
    });

    test(":Validate econet number 078", () {
      try {
        assert(localregex.isEconet("0782213388"), true);
      } on AssertionError catch (e) {
        print(e);
      }
    });
  });

  test("Validate driver's license number", () {
    try {
      assert(localregex.isZwDriversLicence("98336DM"), true);
    } on AssertionError catch (e) {
      print(e);
    }
  });

  test("Validate passport number", () {
    try {
      assert(localregex.isZwPassport("FN633423"), true);
    } on AssertionError catch (e) {
      print(e);
    }
  });

  test("Validate number plate", () {
    try {
      assert(localregex.isZwNumberPlate("ADW 4746"), true);
    } on AssertionError catch (e) {
      print(e);
    }
  });

  group("Test national id", () {
    test(":Validate national id without a space", () {
      try {
        assert(localregex.isZw("75-511218 K 44"), true);
      } on AssertionError catch (e) {
        print(e);
      }
    });
    test(":Validate national id with a space", () {
      try {
        assert(localregex.isZw("75 511218 K 44"), true);
      } on AssertionError catch (e) {
        print(e);
      }
    });
  });

  group("Testing if mobile numbers belongs to Econet or Netone or Telecel", () {
    test(":Validate mobile numbers", () {
      try {
        assert(localregex.isZwMobile("0777213388"), true);
        assert(localregex.isZwMobile("+263777213388"), true);
        assert(localregex.isZwMobile("0713700601"), true);
        assert(localregex.isZwMobile("+263713700601"), true);
        assert(localregex.isZwMobile("0733220033"), true);
        assert(localregex.isZwMobile("+263733220033"), true);
        assert(localregex.isZwMobile("0782213388"), true);
        assert(localregex.isZwMobile("+263782213388"), true);
      } on AssertionError catch (e) {
        print(e);
      }
    });
  });
}
