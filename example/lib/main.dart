import 'package:flutter/material.dart';
import 'package:localregex/localregex.dart';
import 'package:localregex/password_validation/password_text_form_field.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Example(),
    );
  }
}

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  bool _isMobile = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("LocalRegex usage example"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Mobile Number",
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // ignore: missing_return
                    validator: (String? value) {
                      if (!LocalRegex.isValidZimMobile(value!)) {
                        return "Not a valid Zimbabwean mobile number";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blue,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            _isMobile = true;
                          });
                        } else {
                          setState(() {
                            _isMobile = false;
                          });
                        }
                      },
                      child: Text(
                        "VERIFY",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _isMobile ? "Verified" : "Not verified",
                    style: TextStyle(
                      color: _isMobile ? Colors.green : Colors.red,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                PasswordTextFormField(
                  controller: passwordController,
                  overrideValidationRow: true,
                  customValidationSection: customValidationSection,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  showValidationRow: true,
                  debugPrintLoud: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget customValidationSection({
  required bool hasEightCharacters,
  required bool hasCapitalLetter,
  required bool hasSmallCapsLetter,
  required bool hasADigit,
  required bool hasASpecialCharacter,
}) {
  return Container(
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Text(
              "🔠",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              hasCapitalLetter ? "✅" : "❌",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "🔡",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              hasSmallCapsLetter ? "✅" : "❌",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "🔢",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              hasADigit ? "✅" : "❌",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "🔣",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              hasASpecialCharacter ? "✅" : "❌",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "8️⃣ chars",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              hasEightCharacters ? "✅" : "❌",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
