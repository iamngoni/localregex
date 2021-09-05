# localregex

This plugin allows flutter developers to check if an input matches common regex patterns in Zimbabwe
This plugin works for all Flutter supported platforms i.e. Android, iOS, Web and Desktop (Linux, Windows & MacOS).

> Developed by Ngonidzashe Mangudya

## Usage
### Add dependency
> localregex: ^2.0.2

### Import package
```dart
  import 'package:localregex/localregex.dart';
```
### Declare and initialise
```dart
  final localregex = LocalRegex();
```

### Check if a mobile number matches patterns for Econet, Netone or Telecel numbers

```dart
localregex.isNetone('mobile_number');
localregex.isEconet('mobile_number');
localregex.isTelecel('mobile_number');
```

### Check if a mobile number matches any of the patterns for Econet, Netone or Telecel

```dart
localregex.isZwMobile('mobile_number');
```

### Check if a supplied email matches proper email patterns

```dart
localregex.isEmail('email_address');
```

### Check if a supplied national id matches the pattern for Zimbabwean national id

```dart
localregex.isZimbabwean('national_id');
```

### Check passport number

```dart
localregex.isZwPassword('passport_number');
```

### Check number plate

```dart
localregex.isZwNumberPlate('number_plate');
```

### Check driver's license

```dart
localregex.isZwDriversLicence('drivers_license');
```

### Check mobile number and return mobile number in required format

``` dart
String? number = localregex.formatIfIsZimbabwe(
  value: '+263777213388',
  type: FormatTypes.regular,
);
```

## Format Types
### Regular
> This is the general format of mobile numbers e.g. 0777213388
``` dart
FormatTypes.regular
```

### Common
> This is the mobile number format with country code but no + sign e.g. 263777213388
``` dart
FormatTypes.common
```

### Common Plus
> This is the mobile number format with country code and + sign e.g. +263777213388
``` dart
FormatTypes.commonPlus
```

## Inbilt Teknolog ©
