## 4.0.3

- fix: allow lowercase values to be validated in ids

## 4.0.2

- added functionality to check if landline number is valid

```dart
LocalRegex.isZimLandline('0242790122')
```

## 4.0.1+4

- added additional parameter to `formatNumber` extension, you can now optionally choose to clean
  phone number if its formatted (defaults to `true`).

```dart

final p = '(077) 612-3098'.formatNumber(formatType: FormatType.countryCode, cleanNumber: true)

// result
// (077) 612-3098 -> 0776123098
```

- minor changes

## 4.0.1+3

- **fix** update sdk dependency version

## 4.0.1+2

- format IDs with 2 new formatting types.
- **breaking update**: format type on phone numbers is now a named parameter.

## 4.0.1+1

- fix imports

## 4.0.1

- More national identity number tests
- New extension to allow formatting of a string to proper national identity number structure

## 4.0.0

- This version brings **breaking changes** which need to be carefully looked into.
- Most of the method names have been changed
- Usage of MIT License
- Format Number is now a String extension
- Removed PasswordTextFormField widget
- FormatTypes -> FormatType (enum)

## 3.0.5

- Dates regex
  Matches YYYY-MM-DD or YYYY/MM/DD for now

## 3.0.4

- URL Regex

## 3.0.3

- VoIP numbers validation

## 3.0.2+4

- Regex consistency

## 3.0.2+3

- Password regex: Add more special characters

## 3.0.2+2

- PasswordTextFormField: dispose controller

## 3.0.2+1

- PasswordTextFormField: styling

## 3.0.2

- PasswordTextFormField

## 3.0.1

- Fixed password regex

## 3.0.0+1

- Updated README.md
- Documentation

## 3.0.0

- This version brings **breaking changes** which need to be carefully looked into.
- All methods are now static which means no more declaration and initialization
- Changes into naming of methods e.g isZwMobile => isValidZimMobile to make them more descriptive
- Password validation is now available

```dart
LocalRegex.isValidPassword
```

-

## 2.0.3+1

- Fixed minor bug for numbers formatted in weird ways

## 2.0.3

- Properly formatted code

## 2.0.2

- Fixed email regex bug

## 2.0.1+1

- Code formatting

## 2.0.1

- Allow 6 or 7 national id numbers (old and new id numbers)

## 2.0.0

- Mobile number formatting
- Null safety migration

## 1.0.2

- Fixed + sign bug on mobile numbers
- Removed duplicate characters on email validation

## 1.0.1

- Improved email validation

## 1.0.0

- Improved for easy usability
- Updated/totally changed assertion methods
- New method to assert all mobile numbers at once
- Assertion methods:
- isEmail, isNetone, isTelecel, isEconet, isZwMobile, isZw (for National Id, isZwPassport, isZwNumberPlate, isZwNumberPlate

## 0.0.1

First release of localregex
