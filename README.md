# [LocalRegex](https://pub.dev/packages/localregex/)

<img src="https://img.shields.io/pub/v/localregex?style=for-the-badge">
<img src="https://img.shields.io/github/last-commit/iamngoni/localregex">
<img src="https://img.shields.io/twitter/url?label=iamngoni_&style=social&url=https%3A%2F%2Ftwitter.com%2Fiamngoni_">

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis

This plugin allows developers to check if an input matches common regex patterns in Zimbabwe and other countries.
This plugin works for all Flutter supported platforms i.e. Android, iOS, Web and Desktop (Linux, Windows & MacOS).

> Developed by Ngonidzashe Mangudya. Special shoutout to [Kudakwashe Kuzvindiwana](https://github.com/kudak3) for pushing this package the most.

## Usage

### Add dependency

```yaml
dependencies:
  localregex: <version>
```

### Or

```shell
flutter pub add localregex
```

### Import package

```dart
  import 'package:localregex/localregex.dart';
```

> Note that declaration and initialization is no longer necessary

### Check if a mobile number matches patterns for Econet, Netone or Telecel numbers

```dart
LocalRegex.isNetone('mobile_number');
LocalRegex.isEconet('mobile_number');
LocalRegex.isTelecel('mobile_number');
```

### Check if a mobile number matches any of the patterns for Econet, Netone or Telecel

```dart
LocalRegex.isZimMobile('mobile_number');
```

### Check if mobile number is valid (recommended for numbers not from Zimbabwe)

```dart
LocalRegex.isValidMobile('mobile_number');
```

### Check if a supplied email matches proper email patterns

```dart
LocalRegex.isEmail('email_address');
```

### Check if a supplied national id matches the pattern for Zimbabwean national id

```dart
LocalRegex.isZimID('national_id');
```

### Check passport number

```dart
LocalRegex.isZimPassport('passport_number');
```

### Check number plate

```dart
LocalRegex.isZimNumberPlate('number_plate');
```

### Check driver's license

```dart
LocalRegex.isZimDriversLicence('drivers_license');
```

### Check URL

```dart
LocalRegex.isUrl("https://www.google.com");
```

### Check mobile number and returns mobile number in required format (for use with Zim numbers only)

```dart
String? number = '+263777213388'.formatNumber(formatType: FormatType.regular);
```

### Check if password is valid (minimum of 8 characters, at least 1 special character, 1 capital letter, 1 numeric character)

```dart
LocalRegex.isPassword('your_password');
```

## Mobile Number Format Types

### Regular

> This is the general format of mobile numbers e.g. 0777213388

```dart
FormatType.regular
```

### Country Code

> This is the mobile number format with country code but no + sign e.g. 263777213388

```dart
FormatType.countryCode
```

### Country Code Plus

> This is the mobile number format with country code and + sign e.g. +263777213388

```dart
FormatType.countryCodePlus
```

## Format National ID

Here the output format to be used is 11-223344 K 55 as found on most national identity documents in Zimbabwe

```dart
'11223344K55'.formatID(formatType: IdFormatType.proper); // > 11-223344 K 55
```
