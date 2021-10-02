import 'package:localregex/enum.dart';

class FormatTypes<String> extends Enum {
  /// Format is 263
  static final FormatTypes common = FormatTypes("common");

  /// Format is +263
  static final FormatTypes commonPlus = FormatTypes("common+");

  /// Format is 07
  static final FormatTypes regular = FormatTypes("regular");

  FormatTypes(String value) : super(value);
}
