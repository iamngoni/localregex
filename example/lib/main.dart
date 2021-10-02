import 'package:flutter/material.dart';
import 'package:localregex/regex.dart';

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
                    // ignore: missing_return
                    validator: (value) {
                      if (LocalRegex.isValidZimMobile(value)) {
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
                        if (_formKey.currentState.validate()) {
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
