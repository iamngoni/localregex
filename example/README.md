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

### Use in code e.g. form field validation
```dart
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: "Mobile Number",
      ),
      // ignore: missing_return
      validator: (value) {
        if (!localregex.isZwMobile(value)) {
          return "Not a valid Zimbabwean mobile number";
        }
      },
    ),
  ),
```
#### [Check the package out on pub.dev](https://pub.dev/packages/localregex)
#### [Or on my website](https://iamngoni.co.zw/localregex)
