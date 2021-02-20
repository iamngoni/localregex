library localregex;

class LocalRegex {
  /// LocalRegex
  ///
  /// [LocalRegex] is a regex package developed by Ngonidzashe Mangudya
  final RegExp _emailAddress = new RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  final RegExp _econet = RegExp(r'(?:\+?263|0)(77|78)[0-9]{7}$');
  final RegExp _netone = RegExp(r'(?:\+?263|0)(71)[0-9]{7}$');
  final RegExp _telecel = RegExp(r'(?:\+?263|0)(73)[0-9]{7}$');
  final RegExp _nationalId =
      RegExp(r'^([0-9]{2})(-|\s)([0-9]{6})(\s)([A-Z]{1})(\s)([0-9]{2})$');
  final RegExp _numberPlate = RegExp(r'^[A-Z]{3}(-|\s)[0-9]{4}$');
  final RegExp _passportNumber = RegExp(r'^[A-Z]{2}[0-9]{6}$');
  final RegExp _driversLicence = RegExp(r'\d{5}[a-zA-Z]{2}');

  /// Checks if an email address is valid
  bool isEmail(String value) => _emailAddress.hasMatch(value);

  /// Checks if a string is a valid Netone mobile number
  bool isNetone(String value) => _netone.hasMatch(value);

  /// Checks if a string is a valid Telecel mobile number
  bool isTelecel(String value) => _telecel.hasMatch(value);

  /// Checks if a string is a valid Econet mobile number
  bool isEconet(String value) => _econet.hasMatch(value);

  /// Checks if a string is a valid Zimbabwean mobile number registered under the top 3 mobile network providers
  bool isZwMobile(String value) =>
      this.isEconet(value) || this.isNetone(value) || this.isTelecel(value);

  /// Checks if a string is a valid National ID number for Zimbabwe
  bool isZw(String value) => _nationalId.hasMatch(value);

  /// Checks if a string is a valid Passport number for Zimbabwe
  bool isZwPassport(String value) => _passportNumber.hasMatch(value);

  /// Checks if a string is a valid Vehicle Number plate for Zimbabwe
  bool isZwNumberPlate(String value) => _numberPlate.hasMatch(value);

  /// Checks if a string is a valid Driver's Licence for Zimbabwe
  bool isZwDriversLicence(String value) => _driversLicence.hasMatch(value);
}
