# localregex

This plugin allows flutter developers to check if an input matches common regex patterns in Zimbabwe
This plugin works for all Flutter supported platforms i.e. Android, iOS, Web and Desktop (tested on Linux and Windows).

> Developed by Ngonidzashe Mangudya

## Usage
### Add dependency
> localregex: ^1.0.0

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

#### [Check the package out on pub.dev](https://pub.dev/packages/localregex)
#### [Or on my website](https://iamngoni.co.zw/localregex)
